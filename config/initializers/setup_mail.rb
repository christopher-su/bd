ActionMailer::Base.smtp_settings = {
  #:address              => "smtp.gmail.com",
  #:port                 => 587,
  #:domain               => "gmail.com",
  #:user_name            => "brosisdesign.webmaster@gmail.com",
  #:password             => "google_pass",
  #:authentication       => "plain",
  #:enable_starttls_auto => true


    :address              => "smtp.ym.163.com",
    :port                 => 25,
    :domain               => "ym.163.com",
    :user_name            => "system@brosisdesign.com",
    :password             => "sc_pass",
    :authentication       => "plain",
    :enable_starttls_auto => true
}