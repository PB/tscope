class AddIndexToTweets < ActiveRecord::Migration
  def change
    add_index :tweets, [:keyword_id, :tweet_created_at]
  end
end
