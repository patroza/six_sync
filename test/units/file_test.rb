require 'teststrap'

context "File" do
  setup { SixSync::File.new }

  asserts("Default Status") { topic.status == :default }
end
