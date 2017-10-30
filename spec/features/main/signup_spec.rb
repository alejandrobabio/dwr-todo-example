# frozen_string_literal: true

require 'web_spec_helper'

RSpec.feature 'Sign Up' do
  scenario 'sign up as new user' do
    visit '/signup'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'secret'
    click_on 'Sign Up'

    expect(page).to have_content('Welcome!')
  end

  scenario 'show error with invalid email' do
    visit '/signup'
    fill_in 'user[email]', with: 'user'
    fill_in 'user[password]', with: 'secret'
    click_on 'Sign Up'

    expect(find('[name="user[email]"]').value).to eq 'user'
    expect(page).to have_content('Email: is in invalid format')
  end

  scenario 'show error with short password' do
    visit '/signup'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[password]', with: 'nope'
    click_on 'Sign Up'

    expect(page).to have_content('Password: size cannot be less than 6')
  end
end
