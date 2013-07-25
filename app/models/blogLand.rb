require 'rubygems'
require 'eventmachine'
require 'em-http'
require 'json'
require 'oauth'
require 'oauth/client/em_http'
 
# Edit in your details.
CONSUMER_KEY = "<put your consumer secret key here>"
CONSUMER_SECRET = "<put your consumer key here>"
ACCESS_TOKEN = "<put your access token here>"
ACCESS_TOKEN_SECRET = "<put your access token secrethere>"
 
def twitter_oauth_consumer
  @twitter_oauth_consumer ||= OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, :site => "http://twitter.com")
end
 
def twitter_oauth_access_token
  @twitter_oauth_access_token ||= OAuth::AccessToken.new(twitter_oauth_consumer, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
end
 
EventMachine.run do
          # now, let's subscribe to twitter site stream
          # check informaiton on twitter site
          # here we are followig to user that have signed to our app...
          toFollow=[17590452,2071231]
         http = EventMachine::HttpRequest.new('https://betastream.twitter.com/2b/site.json'
).post(:body=>{"follow"=>toFollow.join(",")},
            :head => {"Content-Type" => "application/x-www-form-urlencoded"},
            :timeout => -1) do |client|
            twitter_oauth_consumer.sign!(client, twitter_oauth_access_token)
        end
 
        buffer = ""
 
        http.stream do |chunk|
            buffer += chunk
            while line = buffer.slice!(/.+\r?\n/)
                puts "handling a new event:"+line
            end
        end
        http.errback { puts "oops" }
        http.disconnect { puts "oops, dropped connection?" }
 
 end