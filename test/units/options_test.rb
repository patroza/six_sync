require 'teststrap'
require 'ostruct'

context "Options" do
  context "Parser" do
    context "Main" do
      setup { SixSync::Options }

      context "Default params" do
        setup { topic.parse }
        asserts("returns an OpenStruct") { topic.is_a?(OpenStruct) }
        asserts("tasks is Array") { topic.tasks.is_a?(Array) }
      end

      context "Specific params" do
        asserts("no-verbose") { topic.parse([]).options.verbose? }.equals false
        asserts("verbose") { topic.parse(["-v"]).options.verbose? }.equals true
        asserts("empty argv") { topic.parse(["-v"]).argv }.same_elements []

        # TODO: How to test the exit properly?
        asserts("version") { topic.parse(["--version"])} #.equals 0
        asserts("help") { topic.parse(["--help"]) } #.equals 0

        asserts("init") { topic.parse(["--init"]).tasks }.same_elements [[:init, Dir.pwd]]
        asserts("init at specified dir") { topic.parse(["--init", "C:/test/test"]).tasks }.same_elements [[:init, "C:/test/test"]]
        asserts("clone") { topic.parse(["--clone", "http://localhost/test"]).tasks }.same_elements [[:clone, "http://localhost/test"]]
        asserts("update") { topic.parse(["--update"]).tasks }.same_elements [[:update, Dir.pwd]]
        asserts("repair") { topic.parse(["--repair"]).tasks }.same_elements [[:repair, Dir.pwd]]
        asserts("commit") { topic.parse(["--commit"]).tasks }.same_elements [[:commit, Dir.pwd]]
        asserts("push") { topic.parse(["--push"]).tasks }.same_elements [[:push, Dir.pwd]]
      end
    end

    context "Network" do
      setup { SixSync::NetworkOptions }

      context "Default params" do
        setup { topic.parse }
        asserts("returns an OpenStruct") { topic.is_a?(OpenStruct) }
        asserts("tasks is Array") { topic.tasks.is_a?(Array) }
      end

      context "Specific params" do
        asserts("no-verbose") { topic.parse([]).options.verbose? }.equals false
        asserts("verbose") { topic.parse(["-v"]).options.verbose? }.equals true
        asserts("empty argv") { topic.parse(["-v"]).argv }.same_elements []

        # TODO: How to test the exit properly?
        asserts("version") { topic.parse(["--version"])} #.equals 0
        asserts("help") { topic.parse(["--help"]) } #.equals 0

        asserts("init") { topic.parse(["--init"]).tasks }.same_elements [[:init, Dir.pwd]]
        asserts("init at specified dir") { topic.parse(["--init", "C:/test/test"]).tasks }.same_elements [[:init, "C:/test/test"]]
        asserts("clone") { topic.parse(["--clone", "http://localhost/test"]).tasks }.same_elements [[:clone, "http://localhost/test"]]
        asserts("update") { topic.parse(["--update"]).tasks }.same_elements [[:update, Dir.pwd]]
        asserts("repair") { topic.parse(["--repair"]).tasks }.same_elements [[:repair, Dir.pwd]]
        asserts("commit") { topic.parse(["--commit"]).tasks }.same_elements [[:commit, Dir.pwd]]
        asserts("push") { topic.parse(["--push"]).tasks }.same_elements [[:push, Dir.pwd]]
      end
    end
  end
end
