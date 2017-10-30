# frozen_string_literal: true

module Todo
  module Main
    class Web
      route 'login' do |r|
        r.get do
          r.view 'sessions.login'
        end

        r.post do
          r.resolve 'transactions.login' do |login|
            login.(r[:user]) do |m|
              m.success do |user|
                flash[:notice] = "Welcome back #{user.email}"
                session[:user_id] = user.id
                r.redirect '/'
              end
              m.failure do |error|
                r.view 'sessions.login', error: error
              end
            end
          end
        end
      end

      route 'logout' do |r|
        flash[:notice] = 'User logged out'
        session.clear
        r.redirect '/'
      end
    end
  end
end
