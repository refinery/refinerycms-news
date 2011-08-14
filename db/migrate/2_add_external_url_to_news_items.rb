class AddExternalUrlToNewsItems < ActiveRecord::Migration

  def up
    unless ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:external_url)
      add_column ::Refinery::NewsItem.table_name, :external_url, :string
    end
  end

  def down
    if ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:external_url)
      remove_column ::Refinery::NewsItem.table_name, :external_url
    end
  end

end
