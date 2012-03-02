require 'teststrap'

context "Repository" do
  setup { SixSync::Repository.new }

  asserts("Default Status") { topic.status == :default }

  asserts("Working directory nil") { topic.working_directory }.nil
end
