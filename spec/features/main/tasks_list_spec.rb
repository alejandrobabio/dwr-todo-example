# frozen_string_literal: true

require 'web_spec_helper'

RSpec.feature 'Tasks List' do
  scenario 'list tasks' do
    user = Factory[:user]
    own_tasks = (1..2).map { Factory[:task, user_id: user.id] }
    non_own_tasks = (1..2).map { Factory[:task] }
    login user
    visit '/tasks'
    own_tasks.each do |task|
      expect(page).to have_content(task.description)
    end
    non_own_tasks.each do |task|
      expect(page).not_to have_content(task.description)
    end
  end
end
