require 'refinerycms-core'
require 'refinerycms-settings'
require 'acts_as_indexed'

module Refinery
  autoload :NewsGenerator, 'generators/refinery/news_generator'

  module News
    require 'refinery/news/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end
