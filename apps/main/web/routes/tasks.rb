# frozen_string_literal: true

module Todo
  module Main
    class Web
      route 'tasks' do |r|
        r.is do
          r.get do
            r.view 'tasks.index', current_user: current_user
          end
        end
      end
    end
  end
end
