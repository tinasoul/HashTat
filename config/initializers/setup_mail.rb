ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "mshashtat@gmail.com",
    :password => "dontletgo3",
    :authentication => "plain",
    :enable_starttls_auto => true
  }