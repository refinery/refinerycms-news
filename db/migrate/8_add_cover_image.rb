class AddCoverImage < ActiveRecord::Migration
  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:cover_image_uid)
      add_column ::NewsItem.table_name, :cover_image_uid, :string
    end
    unless ::NewsItem.column_names.map(&:to_sym).include?(:cover_image_name)
      add_column ::NewsItem.table_name, :cover_image_name, :string
    end
  end

  def self.down
    if ::NewsItem.column_names.map(&:to_sym).include?(:cover_image_uid)
      remove_column ::NewsItem.table_name, :cover_image_uid
    end
    if ::NewsItem.column_names.map(&:to_sym).include?(:cover_image_name)
      remove_column ::NewsItem.table_name, :cover_image_name
    end
  end
end