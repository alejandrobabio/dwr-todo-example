# frozen_string_literal: true

require 'todo/view/context'

module Todo
  module Main
    module View
      class Context < Todo::View::Context
        def current_user
          self[:current_user]
        end
      end
    end
  end
end
