# frozen_string_literal: true

require 'dry/web/roda/application'
require_relative 'container'
require 'memoizable'

module Todo
  module Main
    class Web < Dry::Web::Roda::Application
      include Memoizable

      setting :public_routes
      configure do |config|
        config.container = Container
        config.routes = 'web/routes'
        config.public_routes = %w[/ /login /logout /signup]
      end

      opts[:root] = Pathname(__FILE__).join('../../..').realpath.dirname

      use Rack::Session::Cookie, key: 'todo.main.session',
        secret: self['core.settings'].session_secret

      use Rack::MethodOverride

      plugin :csrf, raise: true
      plugin :dry_view
      plugin :error_handler
      plugin :flash
      plugin :multi_route
      plugin :all_verbs

      route do |r|
        unless authorize
          flash[:alert] = 'Unauthorized!'
          r.redirect '/'
        end

        # Enable this after writing your first web/routes/ file
        r.multi_route

        r.root do
          r.view 'welcome'
        end
      end

      def current_user
        return unless session[:user_id]
        self.class['core.repositories.users_repo']
          .users.by_pk(session[:user_id]).one
      end
      memoize :current_user

      def params_with_user(params)
        { params: params, current_user: current_user }
      end

      def hash_with_user(hash = {})
        hash.merge(current_user: current_user)
      end

      # Request-specific options for dry-view context object
      def view_context_options
        {
          flash:        flash,
          csrf_token:   Rack::Csrf.token(request.env),
          csrf_metatag: Rack::Csrf.metatag(request.env),
          csrf_tag:     Rack::Csrf.tag(request.env),
          current_user: current_user
        }
      end

      load_routes!

      private

      def config
        self.class.config
      end

      def authorize
        return true if config.public_routes.include? request.path
        self.class['authorization'].(current_user, request)
      end
    end
  end
end
