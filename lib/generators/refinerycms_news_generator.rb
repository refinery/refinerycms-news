require 'rails/generators/migration'

class RefinerycmsNewsGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration

  source_root File.expand_path('../refinerycms_news/templates/', __FILE__)
  argument :name, :type => :string, :default => 'news_items', :banner => ''
  argument :attributes, :type => :array, :default => ["title:string", "body:text", "publish_date:datetime"]

  def generate
    # seed file
    template 'db/seeds/seed.rb', Rails.root.join('db/seeds/refinerycms_news.rb')

    next_migration_number = ActiveRecord::Generators::Base.next_migration_number(File.dirname(__FILE__))
    template('db/migrate/migration_number_create_singular_name.rb',
             Rails.root.join("db/migrate/#{next_migration_number}_create_#{singular_name}.rb"))

     unless self.behavior == :revoke
       puts "------------------------"
       puts "Now run:"
       puts "rake db:migrate"
       puts "------------------------"
     end
  end
end

# Below is a hack until this issue:
# https://rails.lighthouseapp.com/projects/8994/tickets/3820-make-railsgeneratorsmigrationnext_migration_number-method-a-class-method-so-it-possible-to-use-it-in-custom-generators
# is fixed on the Rails project.

require 'rails/generators/named_base'
require 'rails/generators/migration'
require 'rails/generators/active_model'
require 'active_record'

module ActiveRecord
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      include Rails::Generators::Migration

      # Implement the required interface for Rails::Generators::Migration.
      def self.next_migration_number(dirname) #:nodoc:
        next_migration_number = current_migration_number(dirname) + 1
        if ActiveRecord::Base.timestamped_migrations
          [Time.now.utc.strftime("%Y%m%d%H%M%S"), "%.14d" % next_migration_number].max
        else
          "%.3d" % next_migration_number
        end
      end
    end
  end
end