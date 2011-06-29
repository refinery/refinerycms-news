class AddPreviewText < ActiveRecord::Migration
  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:preview_text)
      add_column ::NewsItem.table_name, :preview_text, :string
      add_column :news_item_translations, :preview_text,  :string
    end
  end

  def self.down
    if ::NewsItem.column_names.map(&:to_sym).include?(:preview_text)
      remove_column ::NewsItem.table_name, :preview_text
      remove_column :news_item_translations, :preview_text
    end
  end
end