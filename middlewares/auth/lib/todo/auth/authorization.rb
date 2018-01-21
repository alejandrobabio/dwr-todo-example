# frozen_string_literal: true

module Todo
  module Auth
    class Authorization
      def call(user, request)
        name = Inflecto.camelize(
          request.path.split('/').reject(&:empty?).first
        )
        Object.const_get("Todo::Auth::Authorizations::#{name}")
          .new.(user, request)
      rescue NameError
        false
      end
    end
  end
end
