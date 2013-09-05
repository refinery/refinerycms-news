class AddCategoryToNewsItems < ActiveRecord::Migration

  def up
    unless Refinery::News::Item.column_names.map(&:to_sym).include?(:category)
      add_column Refinery::News::Item.table_name, :category, :integer
    end
  end

  def down
    if Refinery::News::Item.column_names.map(&:to_sym).include?(:category)
      remove_column Refinery::News::Item.table_name, :category
    end
  end

end
