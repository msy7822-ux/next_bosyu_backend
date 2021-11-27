class ApplicationController < ActionController::API
  def push_to_twitter
    client.update('sample text')
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      config.bearer_token = ENV['TWITTER_BEARER_TOKEN']
      config.consumer_key = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_API_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end
