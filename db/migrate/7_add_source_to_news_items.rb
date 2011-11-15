class AddSourceToNewsItems < ActiveRecord::Migration

  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:source)
      add_column ::NewsItem.table_name, :source, :string
    end
  end

  def self.down
    if ::NewsItem.column_names.map(&:to_sym).include?(:source)
      remove_column ::NewsItem.table_name, :source
    end
  end

end