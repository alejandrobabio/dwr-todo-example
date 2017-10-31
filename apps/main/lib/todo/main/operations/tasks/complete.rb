# frozen_string_literal: true

require 'todo/operation'

module Todo
  module Main
    module Operations
      module Tasks
        class Complete < Todo::Operation
          include Import['core.repositories.tasks_repo']

          def call(id)
            result = tasks_repo.update(id, completed: true)
            Right(result)
          end
        end
      end
    end
  end
end
