# frozen_string_literal: true

Factory.define :user do |f|
  f.sequence(:email) { |i| "user-#{i}@example.com" }
  f.password_digest('secret')
  f.timestamps
end
