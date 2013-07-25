require 'rubygems'
require 'oauth'
require 'json'

class TwitterStream
	# Parse a response from the API and return a user object.
	def parse_user_response(response)
	  user = nil

	  # Check for a successful request
	  if response.code == '200'
	    # Parse the response body, which is in JSON format.
	    # ADD CODE TO PARSE THE RESPONSE BODY HERE
	    user = JSON.parse(response)

	    # Pretty-print the user object to see what data is available.
	    puts user #"Hello, #{user["screen_name"]}!"
	  else
	    # There was an error issuing the request.
	    puts "Expected a response of 200 but got #{response.code} instead"
	  end
  	user
	end

	def request 
		# All requests will be sent to this server.
		baseurl = "https://stream.twitter.com"

		# Verify credentials returns the current user in the body of the response.
		address = URI("#{baseurl}/1.1/statuses/sample.json")

		# Set up HTTP.
		http             = Net::HTTP.new address.host, address.port
		http.use_ssl     = true
		http.verify_mode = OpenSSL::SSL::VERIFY_PEER

		# Set credentials.
		consumer_key ||= OAuth::Consumer.new "PPykc0VEL53gZWqx4eLizw",
		  "OhB7t1vlaXKU4Lf0ND8AEPiUTcYeau5vaLglczSiQ"
		access_token ||= OAuth::Token.new "995884075-0hBEUXGxtTxsErwOLdqR0RCXBJKsK48jxcTnNSkg",
		  "f3iVaSS67BcjXChfG3gKX60igzR7Dja1rci2EiH6I"

		# Issue the request.
		request = Net::HTTP::Get.new address.request_uri
		request.oauth! http, consumer_key, access_token
		http.start
		response = http.request(request)
		parse_user_response(response)
	end 
end


