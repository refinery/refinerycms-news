class AddImageIdToNewsItems < ActiveRecord::Migration

  def self.up
    add_column ::NewsItem.table_name, :image_id, :integer
  end

  def self.down
    remove_column ::NewsItem.table_name, :image_id
  end

end