# frozen_string_literal: true

require 'todo/operation'
require 'dry/validation'
require 'bcrypt'

module Todo
  module Main
    module Operations
      module Users
        class EncryptPassword < Todo::Operation
          def call(args)
            password = args.delete(:password)
            output = args.merge(
              password_digest: BCrypt::Password.create(password)
            )

            Right(output)
          end
        end
      end
    end
  end
end
