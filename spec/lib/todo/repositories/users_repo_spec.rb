# frozen_string_literal: true

require 'db_spec_helper'
require 'todo/repositories/users_repo'

RSpec.describe Todo::Repositories::UsersRepo do
  let(:repo) { Todo::Container['repositories.users_repo'] }

  it 'repo access to existing users' do
    3.times { Factory[:user] }
    expect(repo.users.count).to eq 3
  end

  it 'create a user' do
    expect do
      Factory[:user]
    end.to change(repo.users, :count).from(0).to(1)
  end

  it 'update a user' do
    user = Factory[:user]
    repo.update(user.id, password_digest: 'new secret')
    expect(repo.users.first.password_digest).to eq 'new secret'
  end

  it 'delete a user' do
    user = Factory[:user]
    expect do
      repo.delete(user.id)
    end.to change(repo.users, :count).from(1).to(0)
  end
end
