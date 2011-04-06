class AddExternalUrlToNewsItems < ActiveRecord::Migration

  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:external_url)
      add_column ::NewsItem.table_name, :external_url, :string
    end
  end

  def self.down
    if ::NewsItem.column_names.map(&:to_sym).include?(:external_url)
      remove_column ::NewsItem.table_name, :external_url
    end
  end

end