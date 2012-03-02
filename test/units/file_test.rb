require 'teststrap'

context "File" do
  context "Class" do
    setup { SixSync::File }
    asserts("FileTypes is an array") { topic.file_types.is_a?(Array) }
  end

  setup { SixSync::File.new }

  asserts("Default Status") { topic.status == :default }

  context "PackFile" do
    context "Class" do
      setup { SixSync::File }
      asserts("Filetype registered") { topic.has_file_type?(:pack) }
    end

    setup { SixSync::PackFile.new }
    asserts("Default Status") { topic.status == :default }
  end

  context "WdFile" do
    context "Class" do
      setup { SixSync::File }
      asserts("Filetype registered") { topic.has_file_type?(:wd) }
    end

    setup { SixSync::WdFile.new }
    asserts("Default Status") { topic.status == :default }
  end
end
