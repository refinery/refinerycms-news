class CreateNewsItems < ActiveRecord::Migration

  def self.up
    create_table ::NewsItem.table_name, :id => true do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date

      t.timestamps
    end

    add_index ::NewsItem.table_name, :id
  end

  def self.down
    ::UserPlugin.destroy_all :name => "refinerycms_news"

    ::Page.delete_all :link_url => "/news"

    drop_table ::NewsItem.table_name
  end

end
