class UserCreateNotiferMailer < ApplicationMailer
  default from: 'NextBosyuOffcial@gmail.com'

  def email_auth(email)
    # @user = params[:user]
    @user = User.last
    # @url = 'https://fccc-2400-4153-e003-ea00-d8d4-503e-9bef-1b2.ap.ngrok.io/mail_auth'

    mail(to: email, subject: 'メールアドレスの認証を行ってください。')
  end
end
