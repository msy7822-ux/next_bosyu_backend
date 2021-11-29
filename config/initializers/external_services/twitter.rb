module ExternalServices
  class TwitterClinet
    def initialize(bearer_token:, consumer_key:, consumer_secret:, access_token:, access_token_secret:)
      @client = Twitter::REST::Client.new do |config|
        config.bearer_token = bearer_token
        config.consumer_key = consumer_key
        config.consumer_secret = consumer_secret
        config.access_token = access_token
        config.access_token_secret = access_token_secret
      end
    end

    def post_to_twitter(content:)
      @client.update(content)
    end
  end
end
