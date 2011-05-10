class AddExpirationDateToNewsItems < ActiveRecord::Migration

  def self.up
    unless ::NewsItem.column_names.map(&:to_sym).include?(:expiration_date)
      add_column ::NewsItem.table_name, :expiration_date, :datetime
    end
  end

  def self.down
    if ::NewsItem.column_names.map(&:to_sym).include?(:expiration_date)
      remove_column ::NewsItem.table_name, :expiration_date
    end
  end

end
