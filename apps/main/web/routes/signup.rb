# frozen_string_literal: true

module Todo
  module Main
    class Web
      route 'signup' do |r|
        r.get do
          r.view 'users.signup'
        end

        r.post do
          r.resolve 'transactions.signup' do |signup|
            signup.(r[:user]) do |m|
              m.success do
                flash[:notice] = 'Welcome!'
                r.redirect '/'
              end
              m.failure do |validation|
                r.view 'users.signup', validation: validation
              end
            end
          end
        end
      end
    end
  end
end
