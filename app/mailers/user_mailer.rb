class UserMailer < ActionMailer::Base
  default from: "mrhashtat@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "https://hashtat.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to HashTat!", :from => "mrhashtat@gmail.com")
  end
end
