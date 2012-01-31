# This migration comes from refinery_news (originally 7)
class AddSourceToNewsItems < ActiveRecord::Migration

  def up
    unless Refinery::NewsItem.column_names.map(&:to_sym).include?(:source)
      add_column Refinery::NewsItem.table_name, :source, :string
    end
  end

  def down
    if Refinery::NewsItem.column_names.map(&:to_sym).include?(:source)
      remove_column Refinery::NewsItem.table_name, :source
    end
  end

end