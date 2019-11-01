class AddSlugToNewsItems < ActiveRecord::Migration[4.2]
  def change
    add_column Refinery::News::Item.table_name, :slug, :string
  end
end
