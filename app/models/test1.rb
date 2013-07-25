


# test1.rb

require 'rubygems'
require 'eventmachine'

# EventMachine.run {
#   EventMachine.add_periodic_timer(1) {
#     puts "Hello world"
#   }
#}
##################

EM.run {
  require 'em-http'

  EM::HttpRequest.new('http://json-time.appspot.com/time.json').get.callback { |http|
    puts http.response
  }
}