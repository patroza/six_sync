require 'teststrap'
require 'ostruct'

context "Options" do
  context "Parser" do
    context "Main" do
      setup { SixSync::Options }

      asserts("Default Params") { topic.parse([]) }.raises SystemExit

      asserts("version") { topic.parse(["--version"]) }.raises SystemExit #.equals 0
      asserts("help") { topic.parse(["--help"]) }.raises SystemExit #.equals 0
      #asserts("no-verbose") { topic.parse([]).options.verbose? }.equals false
      asserts("verbose") { topic.parse(["-v"]) }.raises SystemExit

      context "Specific params" do
        asserts("init") { mock(SixSync::Repository).init(Dir.pwd, nil, nil, nil); topic.parse(["init"]) }.nil # Without mock it actually returns the Repository instance
        asserts("init at specified dir") { dir = "C:/test/test"; mock(SixSync::Repository).init(dir, nil, nil, nil); topic.parse(["init", dir]) }.nil
        asserts("clone") { url = "http://localhost/test"; mock(SixSync::Repository).clone(url, Dir.pwd, nil, nil); topic.parse(["clone", url]) }.nil
        asserts("update") { mock(SixSync::Repository).update(Dir.pwd); topic.parse(["update"]) }.nil
        asserts("repair") { mock(SixSync::Repository).repair(Dir.pwd); topic.parse(["repair"]) }.nil
        asserts("commit") { mock(SixSync::Repository).commit(Dir.pwd); topic.parse(["commit"]) }.nil
        asserts("push") { mock(SixSync::Repository).push(Dir.pwd); topic.parse(["push"]) }.nil
      end
    end

    context "Network" do
      setup { SixSync::Options }

      context "Specific params" do
        asserts("init") { mock(SixSync::Network).init(Dir.pwd); topic.parse(["network", "init"]) }.nil # Without mock it actually returns the Network instance
        asserts("init at specified dir") { dir = "C:/test/test"; mock(SixSync::Network).init(dir); topic.parse(["network", "init", dir]) }.nil
        asserts("clone") { url = "http://localhost/test"; mock(SixSync::Network).clone(url, Dir.pwd); topic.parse(["network", "clone", url]) }.nil
        asserts("update") { mock(SixSync::Network).update(Dir.pwd); topic.parse(["network", "update"]) }.nil
        asserts("repair") { mock(SixSync::Network).repair(Dir.pwd); topic.parse(["network", "repair"]) }.nil
        asserts("commit") { mock(SixSync::Network).commit(Dir.pwd); topic.parse(["network", "commit"]) }.nil
        asserts("push") { mock(SixSync::Network).push(Dir.pwd); topic.parse(["network", "push"]) }.nil
      end
    end
  end
end
