class AddIndexToColumnsSlugAndImageIdOnTableNewsItems < ActiveRecord::Migration
  def change
    add_index ::Refinery::News::Item.table_name, :slug
    add_index ::Refinery::News::Item.table_name, :image_id
  end
end
