module RoomsHelper
  require 'twitter'

  def api_request
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("YOUR_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("YOUR_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("YOUR_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("YOUR_ACCESS_SECRET")
    end
    @tweets = client.search('#chiledesperto -rt #chilequierecambios -rt').take(2)
  end
end
