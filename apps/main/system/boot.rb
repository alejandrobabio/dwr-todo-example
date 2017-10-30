# frozen_string_literal: true

require_relative 'todo/main/container'

Todo::Main::Container.finalize!

require 'todo/main/web'
