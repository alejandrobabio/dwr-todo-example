# auto_register: false

require "rom-repository"
require "todo/container"
require "todo/import"

module Todo
  class Repository < ROM::Repository::Root
    include Import.args["persistence.rom"]
  end
end
