class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    p params[:email]
    # @user = User.last
    p UserCreateNotiferMailer.with(user: @user).email_auth(params[:email]).deliver_later
    # p UserCreateNotiferMailer.with(user: @user).email_auth.deliver_now

    render json: { text: 'メールアドレスを送信しました。' }, status: :ok
  end
end
