# frozen_string_literal: true

module Todo
  module Main
    module Authorizations
      class Tasks
        def call(user, _request)
          user
        end
      end
    end
  end
end
