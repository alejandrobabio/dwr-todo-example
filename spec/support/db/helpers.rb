module Test
  module DatabaseHelpers
    module_function

    def rom
      Todo::Container["persistence.rom"]
    end

    def db
      Todo::Container["persistence.db"]
    end
  end
end
