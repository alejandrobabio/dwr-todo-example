# frozen_string_literal: true

require 'todo/main/view/controller'
require 'todo/main/import'

module Todo
  module Main
    module Views
      module Tasks
        class Index < Main::View::Controller
          include Import['policies.tasks_scope']

          configure do |config|
            config.template = 'tasks/index'
          end

          private_expose :current_user

          expose :tasks do |current_user|
            tasks_scope.(current_user).to_a
          end
        end
      end
    end
  end
end
