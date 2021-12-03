class PostBosyuContentToTwitterJob < ApplicationJob
  queue_as :default

  def perform(job_offer_slip)
    pp user = JobOfferSlip.eager_load(corporate: :user).find(job_offer_slip.id).corporate.user
    client.post_to_twitter(title: job_offer_slip.title, name: user.name)
  end

  private

  def client
    ExternalServices::TwitterClinet.new(
      bearer_token: ENV['TWITTER_BEARER_TOKEN'],
      consumer_key: ENV['TWITTER_API_KEY'],
      consumer_secret: ENV['TWITTER_API_SECRET'],
      access_token: ENV['TWITTER_ACCESS_TOKEN'],
      access_token_secret: ENV['TWITTER_ACCESS_SECRET']
    )
  end
end
