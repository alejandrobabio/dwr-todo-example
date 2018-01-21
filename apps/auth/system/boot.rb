require_relative "todo/auth/container"

Todo::Auth::Container.finalize!

require "todo/auth/web"
