# frozen_string_literal: true

require 'todo/main/transaction'

module Todo
  module Main
    module Transactions
      class Signup < Transaction
        step :validate,         with: 'operations.users.validate'
        step :encrypt_password, with: 'operations.users.encrypt_password'
        step :persist,          with: 'operations.users.create'
      end
    end
  end
end
