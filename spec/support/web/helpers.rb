# frozen_string_literal: true

module Test
  module WebHelpers
    module_function

    def app
      Todo::Web.app
    end

    def login(user = Factory[:user])
      visit '/login'
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'secret'
      click_on 'Log in'
    end
  end
end
