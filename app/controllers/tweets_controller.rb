class TweetsController < ApplicationController

  MAX_TWEETS = 20
  DEFAULT_SEARCH = "@GA"
  LANG = 'en'

  def index
    @tweets = Twitter.search(params[:q] ||= DEFAULT_SEARCH, :count => MAX_TWEETS, :lang =>LANG).results

    # Array of search query tweets
    @array_tweets = []
    @tweets.each do |tweet|
    	@array_tweets << tweet.text
    end

    # Filters the tweet query, removes symbols
    @words = @array_tweets.join(" ")
    @clean_words = @words.downcase.split(/\W+/)

    # Count frequency of words and put into @freqs hash
    @freqs = Hash.new(0)
    @clean_words.each { |w| @freqs[w] += 1 }

    # Save frequency of words into database
    @freqs.each do |k, v|
      Query.create word: k.downcase, frequency: v
    end

    @database = Query.all
  end

end
