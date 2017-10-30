# frozen_string_literal: true

require 'web_spec_helper'

RSpec.feature 'Log In' do
  scenario 'Can login with credentials' do
    user = Factory[:user]

    visit '/login'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'secret'
    click_on 'Log in'

    expect(page).to have_content('Welcome back')
    expect(page).to have_content(user.email)
  end

  scenario "Can't login with wrong password" do
    user = Factory[:user]

    visit '/login'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'invalid'
    click_on 'Log in'

    expect(page).to have_content('Invalid Credentials')
  end

  scenario "Can't login with wrong email" do
    Factory[:user]

    visit '/login'
    fill_in 'user[email]', with: 'wrong@email.com'
    fill_in 'user[password]', with: 'secret'
    click_on 'Log in'

    expect(page).to have_content('Invalid Credentials')
  end
end
