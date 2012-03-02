require 'teststrap'

context "Network" do
  setup { SixSync::Network.new }

  asserts("Default Status") { topic.status == :default }
end
