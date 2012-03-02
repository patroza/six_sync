require 'teststrap'

context "Checksum" do
  context "Class" do
    setup { SixSync::Checksum }
    asserts("ChecksumTypes is an array") { topic.checksum_types.is_a?(Array) }
  end

  setup { SixSync::Checksum.new }

  asserts("Default Status") { topic.status == :default }

  context "Md5Checksum" do
    context "Class" do
      setup { SixSync::Checksum }
      asserts("Checksumtype registered") { topic.has_checksum_type?(:md5) }
    end

    setup { SixSync::Md5Checksum.new }

    asserts("Default Status") { topic.status == :default }
  end
  context "Sha1Checksum" do
    context "Class" do
      setup { SixSync::Checksum }
      asserts("Checksumtype registered") { topic.has_checksum_type?(:sha1) }
    end

    setup { SixSync::Sha1Checksum.new }

    asserts("Default Status") { topic.status == :default }
  end
end
