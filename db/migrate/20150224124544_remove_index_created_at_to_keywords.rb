class RemoveIndexCreatedAtToKeywords < ActiveRecord::Migration
  def change
    remove_index :keywords, :created_at
  end
end
