# frozen_string_literal: true

require 'todo/main/transaction'

module Todo
  module Main
    module Transactions
      class Login < Transaction
        step :validate, with: 'operations.sessions.validate'
      end
    end
  end
end
