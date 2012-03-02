require 'teststrap'

context "Repository" do
  setup { SixSync::Repository.new "C:/test/six_sync_test/.sync" } #  "C:/test/six_sync_wd"

  asserts("Default Status") { topic.status == :default }

  asserts("Sync directory") { topic.pack_directory }.equal?("C:/test/six_sync_test/.sync")
  asserts("Working directory") { topic.working_directory }.equal?("C:/test/six_sync_test")
  asserts("Pack directory") { topic.pack_directory }.equal?("C:/test/six_sync_test/.sync/.pack")
end
