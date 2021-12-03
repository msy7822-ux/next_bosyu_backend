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

    def post_to_twitter(title:, name:)
      new_title = title.gsub('/s', "\n")
      text = "募集タイトル: #{new_title}\n募集者: #{name}"
      @client.update(text)
    end
  end
end
