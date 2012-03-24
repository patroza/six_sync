# Include the spec
#require File.join(Rails.root, 'spec/spec_helper')
# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), "../../spec/support/**/*.rb")].each {|f| require f}

# Include the helper methods for shorthand (create, build etc)
#World(FactoryGirl::Syntax::Methods)
