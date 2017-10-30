begin
  require "pry-byebug"
rescue LoadError
end

require_relative "todo/container"

Todo::Container.finalize!

# Load sub-apps
app_paths = Pathname(__FILE__).dirname.join("../apps").realpath.join("*")
Dir[app_paths].each do |f|
  require "#{f}/system/boot"
end

require "todo/web"
