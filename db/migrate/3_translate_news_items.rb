class TranslateNewsItems < ActiveRecord::Migration

  def self.up
    ::Refinery::News::Item.reset_column_information

    unless ::Refinery::News::Item.respond_to?(:translation_class) && ::Refinery::News::Item.translation_class.table_exists?
      ::Refinery::News::Item.create_translation_table!({
        :title => :string,
        :body => :text
      }, {
        :migrate_data => true
      })
    end

    load(Rails.root.join('db', 'seeds', 'refinerycms_news.rb').to_s)
  end

  def self.down
    ::Refinery::News::Item.reset_column_information

    ::Refinery::News::Item.drop_translation_table!
  end

end
