# frozen_string_literal: true

require 'todo/main/transaction'

module Todo
  module Main
    module Transactions
      class CompleteTask < Transaction
        step :find_task, with: 'operations.tasks.find_task'
        step :complete,  with: 'operations.tasks.complete'
      end
    end
  end
end
