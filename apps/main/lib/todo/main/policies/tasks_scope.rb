# frozen_string_literal: true

require 'todo/main/import'

module Todo
  module Main
    module Policies
      class TasksScope
        include Import['core.repositories.tasks_repo']

        def call(user)
          tasks_repo.tasks.where(user_id: user.id)
        end
      end
    end
  end
end
