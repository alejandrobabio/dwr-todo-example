# frozen_string_literal: true

require 'todo/main/view/controller'
require 'todo/main/import'

module Todo
  module Main
    module Views
      module Users
        class Signup < View::Controller
          configure do |config|
            config.template = 'users/signup'
          end

          expose :new_user, :validation

          private

          def new_user(input)
            email = input[:validation].to_h[:email]
            Struct.new(:email, :password).new(email, nil)
          end
        end
      end
    end
  end
end
