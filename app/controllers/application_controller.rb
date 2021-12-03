class ApplicationController < ActionController::API
  before_action :require_login

  include ActionController::Cookies

  def require_login
    return if request.query_parameters[:token]

    @current_user = User.find_by(token: request.query_parameters[:token])
    return if @current_user && request.query_parameters[:session]

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
