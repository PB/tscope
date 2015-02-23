class AddKeywordIndexesToTweets < ActiveRecord::Migration
  def change
    add_index :tweets, :keyword_id
  end
end
