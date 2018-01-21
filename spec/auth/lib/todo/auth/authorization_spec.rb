# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../../../middlewares/auth/lib/todo/auth/authorization'

module Todo
  module Auth
    module Authorizations
      class MyResources
        def call(*)
        end
      end
    end
  end
end

RSpec.describe Todo::Auth::Authorization do
  it 'returns a call response of Authorization class' do
    user = double('user')
    request = double('request', path: '/my_resources/my_path')
    my_resources = instance_double('Todo::Auth::Authorizations::MyResources')
    expect(my_resources).to receive(:call).with(user, request)
      .and_return('whatever')
    expect(Todo::Auth::Authorizations::MyResources).to receive(:new)
      .and_return(my_resources)

    expect(subject.(user, request)).to eq 'whatever'
  end

  it 'returns false if it found an error in root path' do
    user = double('user')
    request = double('request', path: '/missing_resources/my_path')

    expect(subject.(user, request)).to be_falsey
  end
end
