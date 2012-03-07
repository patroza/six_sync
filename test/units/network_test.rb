require 'teststrap'

context "Network" do
  setup { SixSync::Network.new "C:/test/six_sync_test" }

  asserts("Default Status") { topic.status == :default }

  #asserts("Sync directory") { topic.sync_directory }.equals("C:/test/six_sync_test/.sync")
  asserts("Working directory") { topic.working_directory }.equals("C:/test/six_sync_test")
  #asserts("Pack directory") { topic.pack_directory }.equals("C:/test/six_sync_test/.sync/.pack")

  context "Defaults" do
    setup { SixSync::Network.new }

    #asserts("Sync Directory") { topic.sync_directory }.equals(File.join(Dir.pwd, ".sync"))
    asserts("Working Directory") { topic.working_directory }.equals(Dir.pwd)
    #asserts("Pack Directory") { topic.pack_directory }.equals(File.join(Dir.pwd, ".sync", ".pack"))

    asserts("Archive Format") { topic.archive_format }.equals "gz"
  end

=begin
  context "ClassMethods" do
    setup { SixSync::Network }
    context "Init" do
      asserts("Is a SixSync::Network") { topic.init }.is_a?(SixSync::Network)
      asserts("WorkingDirectory") { topic.init.working_directory }.equals Dir.pwd
      #asserts("SyncDirectory") { topic.sync_directory }.equals File.join(Dir.pwd, ".sync")
      #asserts("PackDirectory") { topic.pack_directory }.equals File.join(Dir.pwd, ".sync", ".pack")
    end

    context "Clone" do

      asserts("Is a SixSync::Network") { topic.clone "Url" }.is_a?(SixSync::Network)
      asserts("WorkingDirectory") { topic.clone("Url").topic.working_directory }.equals Dir.pwd
      #asserts("SyncDirectory") { topic.sync_directory }.equals File.join(Dir.pwd, ".sync")
      #asserts("PackDirectory") { topic.pack_directory }.equals File.join(Dir.pwd, ".sync", ".pack")
    end
  end
=end
end
