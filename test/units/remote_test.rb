require 'teststrap'

context "Remote" do
  setup { SixSync::Remote.new }

  asserts("Default Status") { topic.status == :default }
end
