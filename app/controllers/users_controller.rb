class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create # rubocop:disable Metrics/AbcSize
    return puts '必要な情報が足りないです。' unless user_params[:email] && user_params[:name]

    user = User.find_or_initialize_by(email: user_params[:email], token: user_params[:token])
    user.email = user_params[:email]
    user.token = user_params[:token]
    user.name = user_params[:name]
    user.imageUrl = user_params[:imageUrl]
    user = user.save!

    render json: user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :imageUrl, :token, :display_name)
  end
end
