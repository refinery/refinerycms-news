class NewsGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate', :assigns => setup_news_migration_assigns, :migration_file_name => "create_structure_for_news"
    end
  end

private
  def setup_news_migration_assigns
    returning(assigns = {}) do
      assigns[:migration_name] = "CreateStructureForNews"
      assigns[:table_name] = "news_items"

      # add fields for migration
      assigns[:attributes] = []
      [%w(title string), %w(body text), %w(publish_date datetime)].each do |attribute|
        assigns[:attributes] << Rails::Generator::GeneratedAttribute.new(attribute[0], attribute[1])
      end
    end
  end

end