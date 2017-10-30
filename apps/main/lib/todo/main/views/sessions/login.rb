# frozen_string_literal: true

require 'todo/main/view/controller'
require 'todo/main/import'

module Todo
  module Main
    module Views
      module Sessions
        class Login < View::Controller
          configure do |config|
            config.template = 'sessions/login'
          end

          expose :error
        end
      end
    end
  end
end
