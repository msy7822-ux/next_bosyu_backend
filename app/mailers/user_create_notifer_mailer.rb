class UserCreateNotiferMailer < ApplicationMailer
  default from: 'masa.1108@icloud.com'

  def email_auth
    @user = params[:user]
    @url = 'http://localhost:3333'

    mail(to: @user.email, subject: 'メールアドレスの認証を行ってください。')
  end
end
