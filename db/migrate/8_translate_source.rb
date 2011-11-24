class TranslateSource < ActiveRecord::Migration

  def self.up
    puts "TRYING TO MIGRATE"
    unless ::NewsItem::Translation.column_names.map(&:to_sym).include?(:source)
      add_column ::NewsItem::Translation.table_name, :source, :string
    end
  end

  def self.down
    if ::NewsItem::Translation.column_names.map(&:to_sym).include?(:source)
      remove_column ::NewsItem::Translation.table_name, :source
    end
  end

end