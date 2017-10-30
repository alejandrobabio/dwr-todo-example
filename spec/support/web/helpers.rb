# frozen_string_literal: true

module Test
  module WebHelpers
    module_function

    def app
      Todo::Web.app
    end
  end
end
