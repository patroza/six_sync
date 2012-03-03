require 'teststrap'
require 'ostruct'

context "Options" do
  context "Parser" do
    context "Main" do
      setup { SixSync::Options }

      asserts("returns an OpenStruct") { topic.parse.is_a?(OpenStruct) }
      asserts("tasks is Array") { topic.parse.tasks.is_a?(Array) }

      asserts("verbose") { topic.parse(["-v"]).verbose }.equals true
      asserts("no-verbose") { topic.parse(["--no-verbose"]).verbose }.equals false

      # TODO: How to test the exit properly?
      asserts("version") { mock(SixSync::Options).exit { 0 }; topic.parse(["--version"])} #.equals 0
      asserts("help") { mock(SixSync::Options).exit { 0 }; topic.parse(["--help"]) } #.equals 0

      asserts("clone") { topic.parse(["--clone", "http://localhost/test"]).tasks }.same_elements [[:clone, "http://localhost/test"]]
      asserts("init") { topic.parse(["--init"]).tasks }.same_elements [[:init, Dir.pwd]]
      asserts("init at specified dir") { topic.parse(["--init", "C:/test/test"]).tasks }.same_elements [[:init, "C:/test/test"]]
      asserts("update") { topic.parse(["--update"]).tasks }.same_elements [[:update, Dir.pwd]]
      asserts("repair") { topic.parse(["--repair"]).tasks }.same_elements [[:repair, Dir.pwd]]
      asserts("commit") { topic.parse(["--commit"]).tasks }.same_elements [[:commit, Dir.pwd]]
      asserts("push") { topic.parse(["--push"]).tasks }.same_elements [[:push, Dir.pwd]]
    end

    context "Network" do
      setup { SixSync::OptionsNetwork }

      asserts("returns an OpenStruct") { topic.parse.is_a?(OpenStruct) }
      asserts("tasks is Array") { topic.parse.tasks.is_a?(Array) }
    end
  end
end
