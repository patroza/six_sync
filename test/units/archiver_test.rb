require 'teststrap'

context "Archiver" do
  setup { SixSync::Archiver.new }

  asserts("Default Status") { topic.status == :default }
end
