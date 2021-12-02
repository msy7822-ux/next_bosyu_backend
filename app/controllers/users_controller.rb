class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create # rubocop:disable Metrics/AbcSize
    return puts '必要な情報が足りないです。' unless user_params[:email] && user_params[:name]

    # return puts 'ユーザーは存在するのでスルーします。' if User.find_by(email: user_params[:email])
    user = User.find_or_create_by(email: user_params[:email], token: user_params[:token]) do |u|
      u.name = user_params[:name]
      u.imageUrl = user_params[:imageUrl]
      u.token = user_params[:token]
    end
    render json: user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :imageUrl, :token)
  end
end
