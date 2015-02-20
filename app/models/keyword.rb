class Keyword < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  def grab_tweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_consumer_key"]
      config.consumer_secret     = ENV["twitter_consumer_secret"]
      config.access_token        = ENV["twitter_access_token"]
      config.access_token_secret = ENV["twitter_access_token_secret"]
    end

    client.search(self.word, result_type: "recent").take(100).collect do |tweet|
      new_tweet = Tweet.new
      new_tweet.tweet_id = tweet.id.to_s
      new_tweet.tweet_created_at = tweet.created_at
      new_tweet.text = tweet.text
      new_tweet.user_id = tweet.user.id
      new_tweet.user_name = tweet.user.name
      new_tweet.user_screen_name = tweet.user.screen_name
      new_tweet.user_image_url = tweet.user.profile_image_url.to_s
      new_tweet.keyword = self
      new_tweet.save
    end
  end

  def self.grab_all_tweets
    Keyword.all.each do |keyword|
      keyword.grab_tweets
    end
  end
end
