class TranslateNews::Items < ActiveRecord::Migration

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

    load(Rails.root.join('db', 'seeds', 'refinerycms_news.rb').to_s)
  end

  def down
    ::Refinery::News::Item.reset_column_information

    ::Refinery::News::Item.drop_translation_table!
  end

end
