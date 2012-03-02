require 'teststrap'

context "Repository" do
  setup { SixSync::Repository.new "C:/test/six_sync_test/.sync" } #  "C:/test/six_sync_wd"

  asserts("Default Status") { topic.status == :default }

  asserts("Sync directory") { topic.pack_directory }.equal?("C:/test/six_sync_test/.sync")
  asserts("Working directory") { topic.working_directory }.equal?("C:/test/six_sync_test")
  asserts("Pack directory") { topic.pack_directory }.equal?("C:/test/six_sync_test/.sync/.pack")

  context "Defaults" do
    setup { SixSync::Repository.new }

    asserts("Sync Directory") { topic.sync_directory }.equal?(File.join(Dir.pwd, ".sync"))
    asserts("Working Directory") { topic.working_directory }.equal?(Dir.pwd)
    asserts("Pack Directory") { topic.pack_directory }.equal?(File.join(Dir.pwd, ".sync", ".pack"))
  end
end
