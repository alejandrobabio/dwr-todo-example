# frozen_string_literal: true

require 'bcrypt'

Factory.define :user do |f|
  f.sequence(:email) { |i| "user-#{i}@example.com" }
  f.password_digest(BCrypt::Password.create('secret'))
  f.timestamps
end
