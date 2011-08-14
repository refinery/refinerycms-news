require 'refinery/generators'

module Refinery
  class NewsGenerator < ::Refinery::Generators::EngineInstaller

    source_root File.expand_path('../../../', __FILE__)
    engine_name "news"

  end
end
