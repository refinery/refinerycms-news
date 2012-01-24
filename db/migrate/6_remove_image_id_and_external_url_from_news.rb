class RemoveImageIdAndExternalUrlFromNews < ActiveRecord::Migration
  def up
    if ::Refinery::News::Item.column_names.map(&:to_sym).include?(:external_url)
      remove_column ::Refinery::News::Item.table_name, :external_url
    end
    if ::Refinery::News::Item.column_names.map(&:to_sym).include?(:image_id)
      remove_column ::Refinery::News::Item.table_name, :image_id
    end
  end

  def down
    unless ::Refinery::News::Item.column_names.map(&:to_sym).include?(:external_url)
      add_column ::Refinery::News::Item.table_name, :external_url, :string
    end
    unless ::Refinery::News::Item.column_names.map(&:to_sym).include?(:image_id)
      add_column ::Refinery::News::Item.table_name, :image_id, :integer
    end
  end
end
