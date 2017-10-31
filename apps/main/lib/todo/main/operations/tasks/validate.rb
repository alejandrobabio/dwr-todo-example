# frozen_string_literal: true

require 'todo/operation'
require 'dry/validation'

module Todo
  module Main
    module Operations
      module Tasks
        class Validate < Todo::Operation
          Schema = Dry::Validation.Form do
            required(:description).filled(:str?, min_size?: 3)
            required(:user_id).filled(:int?)
          end.freeze
          private_constant :Schema

          def call(hash)
            attrs = hash[:params].merge(user_id: hash[:current_user].id)
            validation = Schema.(attrs)

            if validation.success?
              Right(validation.output)
            else
              Left(validation)
            end
          end
        end
      end
    end
  end
end
