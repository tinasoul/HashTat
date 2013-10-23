class UserMailer < ActionMailer::Base
  default from: "mrhashtat@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @url  = "https://hashtat.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to HashTat!", :from => "mrhashtat@gmail.com")
  end
end
