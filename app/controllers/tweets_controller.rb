class TweetsController < ApplicationController

 
  MAX_TWEETS = 20
  DEFAULT_SEARCH = "@GA"

  def index
    @tweets = Twitter.search(params[:q] ||= DEFAULT_SEARCH, :count => MAX_TWEETS).results


    @newarray = []
    @tweets.each do |tweet|
    	
    	@newarray << tweet.text
    end

  end

  def show
    user = if params[:id].starts_with? "@"
             params[:id][1..-1]
           else
             params[:id].to_i
           end

    @tweets = Twitter.user_timeline(user)
  end
end
