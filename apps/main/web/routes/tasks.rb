# frozen_string_literal: true

module Todo
  module Main
    class Web
      route 'tasks' do |r|
        r.is do
          r.get do
            r.view 'tasks.index', current_user: current_user
          end

          r.post do
            r.resolve 'transactions.create_task' do |create_task|
              create_task.(params_with_user(r[:task])) do |m|
                m.success do |_task|
                  flash[:notice] = 'Task created!'
                  r.redirect '/tasks'
                end
                m.failure do |validation|
                  r.view 'tasks.index', **hash_with_user(validation: validation)
                end
              end
            end
          end
        end

        r.is :id do |id|
          r.patch do
            r.resolve 'transactions.complete_task' do |complete_task|
              complete_task.(params_with_user(id: id)) do |m|
                m.success do |_task|
                  flash[:notice] = "task id: #{id}, completed"
                  r.redirect '/tasks'
                end
                m.failure do
                  flash[:alert] = 'Unexpected error'
                  r.view 'tasks.index', **hash_with_user
                end
              end
            end
          end
        end
      end
    end
  end
end
