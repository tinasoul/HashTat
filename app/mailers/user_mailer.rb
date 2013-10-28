class UserMailer < Devise::Mailer
  default from: "mrhashtat@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "https://hashtat.com"
    mail(:to => user.email, :subject => "Welcome to HashTat!", :from => "mrhashtat@gmail.com")
  end

end