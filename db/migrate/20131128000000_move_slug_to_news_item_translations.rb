class MoveSlugToNewsItemTranslations < ActiveRecord::Migration[4.2]
  def up
    # Fix index problem if this is rolled back
    remove_index Refinery::News::Item.translation_class.table_name, :refinery_news_item_id
    add_index Refinery::News::Item.translation_class.table_name, :refinery_news_item_id, :name => :index_refinery_news_item_translations_fk

    # Add the column
    add_column Refinery::News::Item.translation_class.table_name, :slug, :string

    # Ensure the slug is translated.
    Refinery::News::Item.reset_column_information
    Refinery::News::Item.find_each do |item|
      item.slug = item.slug
      item.save
    end
  end

  def down
    # Move the slug back to the news item table
    Refinery::News::Item.reset_column_information
    Refinery::News::Item.find_each do |item|
      item.slug = if item.translations.many?
        item.translations.detect{|t| t.slug.present?}.slug
      else
        item.translations.first.slug
      end
      item.save
    end

    # Remove the column from the translations table
    remove_column Refinery::News::Item.translation_class.table_name, :slug
  end
end
