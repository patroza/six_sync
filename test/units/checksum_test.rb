require 'teststrap'

context "Checksum" do
  setup { SixSync::Checksum.new }

  asserts("Default Status") { topic.status == :default }

  context "Md5Checksum" do
    setup { SixSync::Md5Checksum.new }

    asserts("Default Status") { topic.status == :default }
  end
  context "Sha1Checksum" do
    setup { SixSync::Sha1Checksum.new }

    asserts("Default Status") { topic.status == :default }
  end
end
