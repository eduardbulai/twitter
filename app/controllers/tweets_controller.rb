class TweetsController < ApplicationController

  MAX_TWEETS = 1000
  DEFAULT_SEARCH = "@GA"
  LANGUAGE = "en"

  def index
    @tweets = Twitter.search(params[:q] ||= DEFAULT_SEARCH, :count => MAX_TWEETS, :lang => LANGUAGE).results

    @array_tweets = []
    @tweets.each do |t|
      @array_tweets << t.text
    end

    # combine array into long string of all tweets
    # TODO: remove symbols, punctuation, https
    @words = @array_tweets.join(" ")

    # split string into words, ignores non-words
    @array_words = @words.split(/\W+/)

    @freqs = Hash.new(0)
    @array_words.each { |word| @freqs[word] += 1 }
    # return hash, named @freqs, with word frequency

    # add "word" and "frequency" to database
    @freqs.each do |k, v|
      Query.create word: k, frequency: v
    end

    @afinn = Words.all

  end

  def csv_push
    CSV.foreach("file.csv", "wb") do |csv|
      csv << [@array]
    end
  end

  # def show
  #   user = if params[:id].starts_with? "@"
  #            params[:id][1..-1]
  #          else
  #            params[:id].to_i
  #          end

  #   @tweets = Twitter.user_timeline(user)
  # end
end
