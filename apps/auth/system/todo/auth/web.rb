# frozen_string_literal: true

require 'dry/web/roda/application'
require_relative 'container'
require 'memoizable'

module Todo
  module Auth
    class Web < Dry::Web::Roda::Application
      include Memoizable

      setting :public_routes

      configure do |config|
        config.container = Container
        config.public_routes = %w[/ /login /logout /signup]
      end

      opts[:root] = Pathname(__FILE__).join('../../..').realpath.dirname

      use Rack::Session::Cookie, key: 'todo.session',
        secret: self['core.settings'].session_secret

      plugin :middleware
      plugin :error_handler
      plugin :flash

      route do |r|
        unless authorize
          flash[:alert] = 'Unauthorized!'
          r.redirect '/'
        end
      end

      private

      def current_user
        return unless session[:user_id]
        self.class['core.repositories.users_repo']
          .users.by_pk(session[:user_id]).one
      end
      memoize :current_user

      def authorize
        return true if config.public_routes.include? request.path
        self.class['authorization'].(current_user, request)
      end

      def config
        self.class.config
      end
    end
  end
end
