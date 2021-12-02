class UserCreateNotiferMailer < ApplicationMailer
  default from: 'NextBosyuOffcial@gmail.com'

  def email_auth(email)
    # @user = params[:user]
    # @user = User.last
    p request
    @url = ''

    mail(to: email, subject: 'メールアドレスの認証を行ってください。')
  end
end
