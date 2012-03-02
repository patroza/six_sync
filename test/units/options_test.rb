require 'teststrap'
require 'ostruct'

module Kernel
  def exit code = 0
    return code
  end
end

context "Options" do
  context "Parser" do
    setup { SixSync::Options }

    asserts("Parse returns an OpenStruct") { topic.parse.is_a?(OpenStruct) }
    asserts("Parse tasks is Array") { topic.parse.tasks.is_a?(Array) }

    asserts("Parse verbose") { topic.parse(["-v"]).verbose }.equals true
    asserts("Parse no-verbose") { topic.parse(["--no-verbose"]).verbose }.equals false

    asserts("Parse version") { topic.parse(["--version"])}.equals 0
    asserts("Parse help") { topic.parse(["--help"]) }.equals 0
    asserts("Parse clone") { topic.parse(["--clone", "http://localhost/test"]).tasks }.same_elements [[:clone, "http://localhost/test"]]
    asserts("Parse init") { topic.parse(["-i"]).tasks }.same_elements [[:init, Dir.pwd]]
    asserts("Parse init at specified dir") { topic.parse(["--init", "C:/test/test"]).tasks }.same_elements [[:init, "C:/test/test"]]
  end
end
