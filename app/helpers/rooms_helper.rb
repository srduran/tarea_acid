module RoomsHelper
  require 'twitter'

  def api_request
    tweets_array = []
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("YOUR_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("YOUR_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("YOUR_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("YOUR_ACCESS_SECRET")
    end
    @tweets = client.search('#chiledesperto -rt #chilequierecambios -rt').take(50)
    @tweets.each do |tweet|
      tweets_array.append(tweet.full_text)
    end
    return tweets_array
  end
end
