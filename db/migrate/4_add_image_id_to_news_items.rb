class AddImageIdToNewsItems < ActiveRecord::Migration

  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:image_id)
      add_column ::NewsItem.table_name, :image_id, :integer
    end
  end

  def self.down
    remove_column ::NewsItem.table_name, :image_id
  end

end