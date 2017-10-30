require "dry/web/container"
require "dry/system/components"

module Todo
  class Container < Dry::Web::Container
    configure do
      config.name = :todo
      config.listeners = true
      config.default_namespace = "todo"
      config.auto_register = %w[lib/todo]
    end

    load_paths! "lib"
  end
end
