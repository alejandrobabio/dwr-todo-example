# frozen_string_literal: true

require 'todo/repository'

module Todo
  module Repositories
    class UsersRepo < Todo::Repository[:users]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
