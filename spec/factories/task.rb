# frozen_string_literal: true

Factory.define :task do |f|
  f.sequence(:description) { |i| "description-#{i}" }
  f.association(:user)
  f.timestamps
end
