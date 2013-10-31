class UserMailer < Devise::Mailer
  default from: "mshashtat@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "https://hashtat.com"
    mail(:to => user.email, :subject => "Welcome to HashTat!", :from => "mshashtat@gmail.com")
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

end