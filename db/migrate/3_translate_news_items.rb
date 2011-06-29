class TranslateNewsItems < ActiveRecord::Migration

  def self.up
    ::Refinery::NewsItem.reset_column_information
    unless defined?(::Refinery::NewsItem::Translation) && ::Refinery::NewsItem::Translation.table_exists?
      ::Refinery::NewsItem.create_translation_table!({
        :title => :string,
        :body => :text,
        :external_url => :string
      }, {
        :migrate_data => true
      })
    end

    load(Rails.root.join('db', 'seeds', 'refinerycms_news.rb').to_s)
  end

  def self.down
    ::Refinery::NewsItem.reset_column_information

    ::Refinery::NewsItem.drop_translation_table!
  end

end
