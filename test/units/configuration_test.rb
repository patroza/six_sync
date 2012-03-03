require 'teststrap'

context "Configuration" do
  setup { SixSync::Configuration.new }

  asserts("Default Status") { topic.status == :default }
end
