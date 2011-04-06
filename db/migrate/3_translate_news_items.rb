class TranslateNewsItems < ActiveRecord::Migration

  def self.up
    ::NewsItem.reset_column_information
    unless defined?(::NewsItem::Translation) && ::NewsItem::Translation.table_exists?
      ::NewsItem.create_translation_table!({
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
    ::NewsItem.reset_column_information

    ::NewsItem.drop_translation_table!
  end

end