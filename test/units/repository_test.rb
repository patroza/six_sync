require 'teststrap'

context "Repository" do
  setup { SixSync::Repository.new }

  asserts("Default Status") { topic.status == :default }
end
