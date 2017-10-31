# frozen_string_literal: true

require 'todo/operation'

module Todo
  module Main
    module Operations
      module Tasks
        class Create < Todo::Operation
          include Import['core.repositories.tasks_repo']

          def call(attrs)
            task = tasks_repo.create(attrs)
            Right(task)
          end
        end
      end
    end
  end
end
