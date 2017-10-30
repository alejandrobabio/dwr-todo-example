# frozen_string_literal: true

require 'web_spec_helper'

RSpec.feature 'Log Out' do
  scenario 'Can logout' do
    user = Factory[:user]

    visit '/login'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'secret'
    click_on 'Log in'

    expect(page).to have_content('Welcome back')
    expect(page).to have_content(user.email)

    visit '/logout'

    expect(page).not_to have_content(user.email)
  end
end
