# This migration comes from refinery_news (originally 8)
class TranslateSource < ActiveRecord::Migration

  def up
    unless Refinery::NewsItem::Translation.column_names.map(&:to_sym).include?(:source)
      add_column Refinery::NewsItem::Translation.table_name, :source, :string
    end
  end

  def down
    if Refinery::NewsItem::Translation.column_names.map(&:to_sym).include?(:source)
      remove_column Refinery::NewsItem::Translation.table_name, :source
    end
  end

end