class TweetsController < ApplicationController

 
  MAX_TWEETS = 20
  DEFAULT_SEARCH = "@GA"
  LANG = 'en'
  def index
    @tweets = Twitter.search(params[:q] ||= DEFAULT_SEARCH, :count => MAX_TWEETS, :lang =>LANG).results

#Array of search query tweets
    @array_tweets = []
    @tweets.each do |tweet|
    	@array_tweets << tweet.text
    end

#Filters the tweet query
@words = @array_tweets.join(" ")
@clean_words = @words.downcase.split(/\W+/)

#puts frequency of word into hash
@freqs = Hash.new(0)
@clean_words.each { |w| @freqs[w] += 1 }

####puts the frequency into a hash
@freqs.each do |k, v|
  Tweet.create word: k.downcase, frequency: v
end

@database = Tweet.all

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
