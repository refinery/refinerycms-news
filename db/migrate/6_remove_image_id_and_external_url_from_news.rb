class RemoveImageIdAndExternalUrlFromNews < ActiveRecord::Migration
  def self.up
    if ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:external_url)
      remove_column ::Refinery::NewsItem.table_name, :external_url
    end
    if ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:image_id)
      remove_column ::Refinery::NewsItem.table_name, :image_id
    end
  end

  def self.down
    unless ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:external_url)
      add_column ::Refinery::NewsItem.table_name, :external_url, :string
    end
    unless ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:image_id)
      add_column ::Refinery::NewsItem.table_name, :image_id, :integer
    end
  end
end
