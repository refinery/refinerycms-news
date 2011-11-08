class TranslateNewsItems < ActiveRecord::Migration

  def self.up
    ::Refinery::NewsItem.reset_column_information

    unless ::Refinery::NewsItem.respond_to?(:translation_class) && ::Refinery::NewsItem.translation_class.table_exists?
      ::Refinery::NewsItem.create_translation_table!({
        :title => :string,
        :body => :text
      }, {
        :migrate_data => true
      })
    end

    Refinery::News::Engine.load_seed
  end

  def self.down
    ::Refinery::NewsItem.reset_column_information

    ::Refinery::NewsItem.drop_translation_table!
  end

end
