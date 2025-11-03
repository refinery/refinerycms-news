class TranslateNewsItems < ActiveRecord::Migration[4.2]

  def up
    ::Refinery::News::Item.reset_column_information
    unless defined?(::Refinery::News::Item::Translation) && ::Refinery::News::Item::Translation.table_exists?
      ::Refinery::News::Item.create_translation_table!({
        :title => :string,
        :body => :text,
      }, {
        :migrate_data => true
      })
    end
  end

  def down
    ::Refinery::News::Item.reset_column_information

    ::Refinery::News::Item.drop_translation_table!
  end

end
