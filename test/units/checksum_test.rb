require 'teststrap'

context "Checksum" do
  setup { SixSync::Checksum.new }

  asserts("Default Status") { topic.status == :default }
end
