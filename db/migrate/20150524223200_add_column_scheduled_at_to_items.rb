class AddColumnScheduledAtToItems < ActiveRecord::Migration
  def change
    add_column ::Refinery::News::Item.table_name, :scheduled_at, :datetime
  end
end
