class AddIndexCreatedAtToKeywords < ActiveRecord::Migration
  def change
    add_index :keywords, :created_at
  end
end
