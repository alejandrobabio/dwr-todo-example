require "todo/auth/view/controller"

module Todo
  module Auth
    module Views
      class Welcome < View::Controller
        configure do |config|
          config.template = "welcome"
        end
      end
    end
  end
end
