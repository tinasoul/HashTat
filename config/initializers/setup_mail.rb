ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => "mrhashtat@gmail.com",
    :password => "workhardplayhard",
    :authentication => "plain",
    :enable_starttls_auto => true
  }