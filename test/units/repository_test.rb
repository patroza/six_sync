require 'teststrap'

context "Repository" do
  setup { SixSync::Repository.new "C:/test/six_sync_test/.sync" } #  "C:/test/six_sync_wd"

  asserts("Default Status") { topic.status == :default }

  asserts("Sync directory") { topic.sync_directory }.equals("C:/test/six_sync_test/.sync")
  asserts("Working directory") { topic.working_directory }.equals("C:/test/six_sync_test")
  asserts("Pack directory") { topic.pack_directory }.equals("C:/test/six_sync_test/.sync/.pack")

  context "Defaults" do
    setup { SixSync::Repository.new }

    asserts("Sync Directory") { topic.sync_directory }.equals(File.join(Dir.pwd, ".sync"))
    asserts("Working Directory") { topic.working_directory }.equals(Dir.pwd)
    asserts("Pack Directory") { topic.pack_directory }.equals(File.join(Dir.pwd, ".sync", ".pack"))

    asserts("Archive Format") { topic.archive_format }.equals "gz"
  end

  context "ClassMethods" do
    setup { SixSync::Repository }
    context "Init" do
      setup { topic.init }

      asserts("Is a SixSync::Repository") { topic }.is_a?(SixSync::Repository)
      asserts("WorkingDirectory") { topic.working_directory }.equals Dir.pwd
      asserts("SyncDirectory") { topic.sync_directory }.equals File.join(Dir.pwd, ".sync")
      asserts("PackDirectory") { topic.pack_directory }.equals File.join(Dir.pwd, ".sync", ".pack")
    end

    context "Clone" do
      setup { topic.clone "Url" }

      asserts("Is a SixSync::Repository") { topic }.is_a?(SixSync::Repository)
      asserts("WorkingDirectory") { topic.working_directory }.equals Dir.pwd
      asserts("SyncDirectory") { topic.sync_directory }.equals File.join(Dir.pwd, ".sync")
      asserts("PackDirectory") { topic.pack_directory }.equals File.join(Dir.pwd, ".sync", ".pack")
    end
  end
end
