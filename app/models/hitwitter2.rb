require 'rubygems'
require 'oauth'
require 'json'
 
 class TwitterStream2

 	def giveme

CONSUMER_KEY = '"PPykc0VEL53gZWqx4eLizw'
CONSUMER_SECRET = 'OhB7t1vlaXKU4Lf0ND8AEPiUTcYeau5vaLglczSiQ'
OAUTH_TOKEN = '995884075-0hBEUXGxtTxsErwOLdqR0RCXBJKsK48jxcTnNSkg'
OAUTH_SECRET = 'f3iVaSS67BcjXChfG3gKX60igzR7Dja1rci2EiH6I'
 
 
@consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET)                                              
@access = OAuth::Token.new(OAUTH_TOKEN, OAUTH_SECRET)                                                       
 
uri = URI("https://stream.twitter.com/1.1/statuses/filter.json?track=romney")
 
Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
  request = Net::HTTP::Post.new uri.request_uri
  request.oauth!(http, @consumer, @access)
 
  puts request['Authorization']
 
  http.request request do |response|
    response.read_body do |chunk|
      j = JSON.parse(chunk)
      puts "#{j["user"]["screen_name"]}: #{j["text"]}"
  end
    end
  end
end
end