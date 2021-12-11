class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[create myself]
  def create
    puts 'users_contorroler'
    ### 今起きているエラーはこの辺りがめちゃくちゃ怪しい
    user = User.find_by(token: user_params[:token])
    user ||= User.create!(user_params)
    pp user

    render json: user, status: :ok
  end

  def myself
    user = User.find_by(token: params[:token])
    render json: user, status: :ok
  end

  def name
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :imageUrl, :token)
  end
end
