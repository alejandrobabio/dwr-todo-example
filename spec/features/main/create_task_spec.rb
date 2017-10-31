# frozen_string_literal: true

require 'web_spec_helper'

RSpec.feature 'Create Task' do
  before do
    login
  end

  scenario 'create task from index page' do
    visit '/tasks'
    fill_in 'Add a new task', with: 'My new task'
    page.submit find('form')

    expect(find('li.task')).to have_content('My new task')
  end

  scenario "can't create task with a short name" do
    visit '/tasks'
    fill_in 'Add a new task', with: 'My'
    page.submit find('form')

    expect(find('ul')).not_to have_content('My')
    expect(find('input').value).to eq 'My'
    expect(page).to have_content('Description: size cannot be less than 3')
  end
end
