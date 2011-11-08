class AddImageIdToNewsItems < ActiveRecord::Migration

  def up
    unless ::Refinery::News::Item.column_names.map(&:to_sym).include?(:image_id)
      add_column ::Refinery::News::Item.table_name, :image_id, :integer
    end
  end

  def down
    remove_column ::Refinery::News::Item.table_name, :image_id
  end

end
