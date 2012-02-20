# unicorn -c /var/www/setupboard/current/config/unicorn.conf.rb -E production -D

APP_DIR = "/var/www/Brosis/current"

worker_processes 1


# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory APP_DIR

# Restart any workers that haven't responded in 30 seconds
timeout 30

# Listen on a Unix data socket
listen  APP_DIR + '/tmp/sockets/unicorn.sock', :backlog => 128

pid    APP_DIR + "/tmp/pids/unicorn.pid"


# log
stderr_path "#{APP_DIR}/log/unicorn.stderr.log"
stdout_path "#{APP_DIR}/log/unicorn.stdout.log"


# Load rails+nano into the master before forking workers
# for super-fast worker spawn times
preload_app true

##
# REE
# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end


before_fork do |server, worker|
  ##
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  
  ##
  # kill old when restart
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
  
end


after_fork do |server, worker|
  
  ##
  # Unicorn master loads the app then forks off workers - because of the way
  # Unix forking works, we need to make sure we aren't using any of the parent's
  # sockets, e.g. db connection
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection

  ##
  # drop permissions to "www:www" in the worker
  # generally there's no reason to start Unicorn as a priviledged user
  # as it is not recommended to expose Unicorn to public clients.
  worker.user('git', 'git') if Process.euid == 0
  
  # Reconnect memcached
  # Rails.cache.reset
end


before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{APP_DIR}/Gemfile"
end
