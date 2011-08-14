class AddExpirationDateToNewsItems < ActiveRecord::Migration

  def up
    unless ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:expiration_date)
      add_column ::Refinery::NewsItem.table_name, :expiration_date, :datetime
    end
  end

  def down
    if ::Refinery::NewsItem.column_names.map(&:to_sym).include?(:expiration_date)
      remove_column ::Refinery::NewsItem.table_name, :expiration_date
    end
  end

end
