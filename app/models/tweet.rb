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
    Tweet.delete(to_destroy) if to_destroy.any?
  end

  def self.delete_older_than_x_days(number_of_days)
    number_of_days = 2 if number_of_days.to_int < 2
    Tweet.delete_all("tweet_created_at < '#{number_of_days.days.ago}'")
    ActionController::Base.new.expire_fragment('keywords_home_table')
  end
end
