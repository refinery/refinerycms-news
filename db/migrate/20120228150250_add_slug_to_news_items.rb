class AddSlugToNewsItems < ActiveRecord::Migration
  def change
    add_column Refinery::News::Item.table_name, :slug, :string
  end
end
