ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "brosisdesign.webmaster@gmail.com",
  :password             => "google_pass",
  :authentication       => "plain",
  :enable_starttls_auto => true
}