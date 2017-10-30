require "pathname"
require "dry/web/container"
require "dry/system/components"

module Todo
  module Main
    class Container < Dry::Web::Container
      require root.join("system/todo/container")
      import core: Todo::Container

      configure do |config|
        config.root = Pathname(__FILE__).join("../../..").realpath.dirname.freeze
        config.logger = Todo::Container[:logger]
        config.default_namespace = "todo.main"
        config.auto_register = %w[lib/todo/main]
      end

      load_paths! "lib"
    end
  end
end
