require 'rubygems'
require 'httparty'
require 'json'

response = HTTParty.get("http://www.google.com/uds/GlangDetect", :query => {
  :v => '1.0',
  :q => "Sgwn i os yw google yn deall Cymraeg?"
})

p JSON.parse(response.body)["responseData"]

# => {"isReliable"=>true, "confidence"=>0.5834181, "language"=>"cy"}