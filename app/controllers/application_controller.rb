class ApplicationController < ActionController::API
  before_action :require_login

  include ActionController::Cookies

  def set_current_user(email) # rubocop:disable Naming/AccessorMethodName
    # @current_user = User.find_by(email: email)
    @current_user = email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    return if @current_user

    render json: { error_type: 'not authorized', message: '認証がされていません。' }, status: :unauthorized
  end

  private

  def tw_client
    ExternalServices::TwitterClinet.new(
      bearer_token: ENV['TWITTER_BEARER_TOKEN'],
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_API_SECRET'],
      access_token: ENV['TWITTER_ACCESS_TOKEN'],
      access_token_secret: ENV['TWITTER_ACCESS_SECRET']
    )
  end
end
