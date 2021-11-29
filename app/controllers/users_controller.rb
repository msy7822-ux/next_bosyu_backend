class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    @user = User.last
    # p UserCreateNotiferMailer.with(user: @user).email_auth.deliver_later
    p UserCreateNotiferMailer.with(user: @user).email_auth.deliver_now
  end
end
