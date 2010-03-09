class NewsGenerator < Rails::Generator::NamedBase

  def initialize(*runtime_args)
    # set first argument to the table's name so that the user doesn't have to pass it in.
    runtime_args[0] = ["news_items"]
    super(*runtime_args)
  end

  def banner
    "Usage: script/generate news"
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate',
        :migration_file_name => "create_structure_for_news",
        :assigns => {
          :migration_name => "CreateStructureForNews",
          :table_name => "news_items",
          :attributes => [
            Rails::Generator::GeneratedAttribute.new("title", "string"),
            Rails::Generator::GeneratedAttribute.new("body", "text"),
            Rails::Generator::GeneratedAttribute.new("publish_date", "datetime")
          ]
        }
    end
  end

end if defined?(Rails::Generator::NamedBase)