require 'rubygems'
require 'net/ssh'

STDOUT.sync = true; STDOUT.flush;
STDERR.sync = true; STDERR.flush

APP_NAME      = "Brosis"
APP_ROOT      = "/var/www/#{APP_NAME}"
GIT_URL        = "/home/git/repositories/Brosis.git"
GIT_BRANCH    = "origin/master"
RELEASE_PATH   = "#{APP_ROOT}/current"
SHARED_PATH   = "#{APP_ROOT}/shared"


def init
  puts "\ninit deploy config..."

  $config = {
    :www => {:host => "173.255.203.131", :user => "git", :password => "git" }
  }
end

def get_host(role)
  $config[role]
end


def run(cmd)
  output = ''
  host = get_host(:www)
  Net::SSH.start(host[:host], host[:user], :port => 22, :password => host[:password]) do |ssh|
    ssh.exec!(cmd) do |ch, stream, data|
      if stream == :stderr
        p '------------------------------'
        p data
        p '------------------------------'
      else
        output += data
      end
    end
  end

  output
end



namespace :deploy do
 
  desc "!deploy setup just run it the first time!"
  task :setup do
    puts "\nSetup ..."
    init
    
    target_dirs = %w(
      shared/log
      shared/tmp/sockets
      shared/tmp/pids
      shared/tmp/sessions
      shared/tmp/cache
      shared/config
      shared/upfile      
    )
    
    mkdir_commands = target_dirs.map{ |target_dir| "mkdir -p #{APP_ROOT}/#{target_dir}" }
    run "#{mkdir_commands.join(" && ")} && git clone #{GIT_URL} #{RELEASE_PATH}"
    
    cmd_touch_log_files = %w(production.log unicorn.stderr.log unicorn.stdout.log).map do |log|
      "touch #{SHARED_PATH}/log/#{log}"
    end
    run "#{cmd_touch_log_files.join(" && ")}"
    
    puts "done"
  end


  desc "Deploy app"
  task :go do
    puts "deploy app..."
    init
    update_code
    make_symlinks
  end
end


def cleanup
  puts "\nCleanning ..."
  puts "done"
end


def update_code
  puts "\nUpdate code ..."
  run "cd #{RELEASE_PATH}; git fetch origin; git reset --hard #{GIT_BRANCH}"
  puts "done"
end


def make_symlinks
  puts "\nBuilding symlinks ..."

  cmd_mkdir = %w(tmp/sockets tmp/pids tmp/cache tmp/sessions log public/cache public/files/upfile).map do |dir|
    "mkdir -p #{RELEASE_PATH}/#{dir}"
  end
  run "#{cmd_mkdir.join(" && ")}"

  normal_symlinks = %w(
    tmp/sockets
    tmp/pids
    tmp/cache
    tmp/sessions
    log/production.log
    log/unicorn.stderr.log
    log/unicorn.stdout.log
  )
  
  commands = normal_symlinks.map do |path|
    sym_lnk_path = "#{RELEASE_PATH}/#{path}"
    "rm -rf #{sym_lnk_path} && ln -s #{SHARED_PATH}/#{path} #{sym_lnk_path}"
  end
  run "#{commands.join(" && ")}"

  other_commands = []

  rails_cache_path = "#{RELEASE_PATH}/public/cache"
  other_commands << "rm -rf #{rails_cache_path} && ln -s #{SHARED_PATH}/tmp/cache #{rails_cache_path}"

  svn_images_path = "#{RELEASE_PATH}/public/files/upfile"
  other_commands << "rm -rf #{svn_images_path} && ln -s #{SHARED_PATH}/upfile/ #{svn_images_path}"

  run "#{other_commands.join(" && ")}"

  puts "done"
end



namespace :unicorn do

  desc "Start unicorn"
  task :start do
    init
    puts "\nStart unicorn ..."
    
    run "cd #{RELEASE_PATH} && /opt/ree/bin/unicorn -c #{RELEASE_PATH}/config/unicorn.conf.rb -E production -D"
    
    puts "done."
  end

  desc "Restart unicorn"
  task :restart do
    init
    puts "\nReStart unicorn ..."
    
    run "kill -USR2 `cat #{RELEASE_PATH}/tmp/pids/unicorn.pid`"
    
    puts "done."
  end

  desc "Stop unicorn"
  task :stop do
    init
    puts "\nStop unicorn ..."
    
    run "kill -QUIT `cat #{RELEASE_PATH}/tmp/pids/unicorn.pid`"
    
    puts "done."
  end
end


