# frozen_string_literal: true

require 'web_spec_helper'

RSpec.feature 'Create Task' do
  scenario 'complete own task' do
    user = Factory[:user]
    Factory[:task, user_id: user.id]
    login user

    visit '/tasks'
    within('li.task') do
      click_on('Complete')
    end

    expect(find('li.task')).to have_content('Completed')
  end
end
