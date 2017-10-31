# frozen_string_literal: true

require 'todo/operation'

module Todo
  module Main
    module Operations
      module Tasks
        class FindTask < Todo::Operation
          include Import['policies.tasks_scope']

          def call(hash)
            id = tasks_scope.(hash[:current_user])
              .where(id: hash[:params][:id]).pluck(:id).first

            if id
              Right(id)
            else
              Left(:error)
            end
          end
        end
      end
    end
  end
end
