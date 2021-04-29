class AddExternalUrlToNewsItems < ActiveRecord::Migration[4.2]

  def up
    unless ::Refinery::News::Item.column_names.map(&:to_sym).include?(:external_url)
      add_column ::Refinery::News::Item.table_name, :external_url, :string
    end
  end

  def down
    if ::Refinery::News::Item.column_names.map(&:to_sym).include?(:external_url)
      remove_column ::Refinery::News::Item.table_name, :external_url
    end
  end

end
