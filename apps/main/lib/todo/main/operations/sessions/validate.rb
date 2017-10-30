# frozen_string_literal: true

require 'todo/operation'
require 'todo/main/import'
require 'bcrypt'

module Todo
  module Main
    module Operations
      module Sessions
        class Validate < Todo::Operation
          include Import['core.repositories.users_repo']

          def call(attrs)
            email, password = attrs.values_at('email', 'password')
            user = users_repo.users.where(email: email).one

            if user && BCrypt::Password.new(user.password_digest) == password
              Right(user)
            else
              Left('Invalid Credentials')
            end
          end
        end
      end
    end
  end
end
