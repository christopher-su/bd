ActionMailer::Base.smtp_settings = {
  #:address              => "smtp.gmail.com",
  #:port                 => 587,
  #:domain               => "gmail.com",
  #:user_name            => "brosisdesign.webmaster@gmail.com",
  #:password             => "google_pass",
  #:authentication       => "plain",
  #:enable_starttls_auto => true


    # :address              => "smtp.exmail.qq.com",
    # :port                 => 25,
    # :domain               => "exmail.qq.com",
    # :user_name            => "system@brosisdesign.com",
    # :password             => "sys_141242",
    # :authentication       => "login",
    # :enable_starttls_auto => true

    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "system@brosisdesign.com",
    :password             => "sys_141242",
    :authentication       => "login",
    :enable_starttls_auto => true
}