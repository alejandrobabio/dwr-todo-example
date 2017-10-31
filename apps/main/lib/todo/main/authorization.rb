# frozen_string_literal: true

module Todo
  module Main
    class Authorization
      def call(user, request)
        name = Inflecto.camelize(
          request.path.split('/').reject(&:empty?).first
        )
        Object.const_get("Todo::Main::Authorizations::#{name}")
          .new.(user, request)
      rescue NameError
        false
      end
    end
  end
end
