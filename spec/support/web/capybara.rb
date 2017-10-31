# frozen_string_literal: true

module Capybara
  class Session
    def submit(element)
      Capybara::RackTest::Form.new(driver, element.native).submit({})
    end
  end
end
