# frozen_string_literal: true

require 'todo/main/transaction'

module Todo
  module Main
    module Transactions
      class CreateTask < Transaction
        step :validate, with: 'operations.tasks.validate'
        step :persist,  with: 'operations.tasks.create'
      end
    end
  end
end
