class Tweet < ActiveRecord::Base
  belongs_to :keyword

  def self.remove_duplicates
    unique_array = []
    to_destroy = []
    Tweet.includes(:keyword).all.each do |tweet|
      key = tweet.tweet_id.to_s + ' ' + tweet.keyword.word
      if !unique_array.include?(key)
        unique_array << key
      else
        to_destroy << tweet.id
      end
    end
    Tweet.delete(to_destroy)
  end
end
