class AddImageIdToNewsItems < ActiveRecord::Migration

  def self.up
    unless ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:image_id)
      add_column ::Refinery::NewsItem.table_name, :image_id, :integer
    end
  end

  def self.down
    remove_column ::Refinery::NewsItem.table_name, :image_id
  end

end
