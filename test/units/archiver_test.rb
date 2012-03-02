require 'teststrap'

context "Archiver" do
  context "Class" do
    setup { SixSync::Archiver }

    asserts("archiver_types is an array") { topic.archiver_types.is_a?(Array) }
  end

  setup { SixSync::Archiver.new }

  asserts("Default Status") { topic.status == :default }

  context "Zip7" do
    context "Class" do
      setup { SixSync::Archiver }
      asserts("Archiver type registered") { topic.has_archiver_type?(:zip7) }
    end

    setup { SixSync::Zip7Archiver.new }

    asserts("Default Status") { topic.status == :default }
  end

  context "Gzip" do
    context "Class" do
      setup { SixSync::Archiver }
      asserts("Archiver type registered") { topic.has_archiver_type?(:gzip) }
    end

    setup { SixSync::GzipArchiver.new }

    asserts("Default Status") { topic.status == :default }
  end
end
