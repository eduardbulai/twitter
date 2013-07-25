module TweetsHelper

  # Linkifies usernames in a tweet's text
  def linkify(tweet)
    tweet.text.gsub /@[a-zA-Z0-9_]{1,15}/ do |match|
      link_to match, tweet_path(match)
    end.html_safe
  end

  # highlights a search query in the tweet's text by
  # surrounding it with <b> tags
  # (only works for simple queries)
  def highlight(tweet, query = '')
    unless query.blank?
      tweet.text.gsub! query do |match|
        content_tag(:b, match)
      end
    end
    tweet
  end

end
