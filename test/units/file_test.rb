require 'teststrap'

context "File" do
  setup { SixSync::File.new }

  asserts("Default Status") { topic.status == :default }

  context "PackFile" do
    setup { SixSync::PackFile.new }
    asserts("Default Status") { topic.status == :default }
  end

  context "WdFile" do
    setup { SixSync::WdFile.new }
    asserts("Default Status") { topic.status == :default }
  end
end
