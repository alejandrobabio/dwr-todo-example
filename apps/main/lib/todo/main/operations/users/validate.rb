# frozen_string_literal: true

require 'todo/operation'
require 'dry/validation'

module Todo
  module Main
    module Operations
      module Users
        class Validate < Todo::Operation
          EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

          Schema = Dry::Validation.Form do
            required(:email).filled(format?: EMAIL_REGEX)
            required(:password).filled(:str?, min_size?: 6)
          end.freeze
          private_constant :Schema

          def call(*args)
            validation = Schema.(*args)

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
