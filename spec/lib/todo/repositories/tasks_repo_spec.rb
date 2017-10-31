# frozen_string_literal: true

require 'db_spec_helper'
require 'todo/repositories/tasks_repo'

RSpec.describe Todo::Repositories::TasksRepo do
  let(:repo) { Todo::Container['repositories.tasks_repo'] }

  it 'repo access to existing tasks' do
    3.times { Factory[:task] }
    expect(repo.tasks.count).to eq 3
  end

  it 'create a task' do
    expect do
      repo.create(description: 'test task')
    end.to change(repo.tasks, :count).from(0).to(1)
  end

  it 'update a task' do
    task = repo.create(description: 'test task')
    repo.update(task.id, description: 'updated')
    expect(repo.tasks.first.description).to eq 'updated'
  end

  it 'delete a task' do
    task = repo.create(description: 'test task')
    expect do
      repo.delete(task.id)
    end.to change(repo.tasks, :count).from(1).to(0)
  end
end
