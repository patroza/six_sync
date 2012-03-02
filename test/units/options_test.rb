require 'teststrap'
require 'ostruct'

module Kernel
  def exit code = 0
    return code
  end
end

context "Options" do
  setup { SixSync::Options }

  asserts("Parse returns an OpenStruct") { topic.parse.is_a?(OpenStruct) }
  asserts("Parse tasks is Array") { topic.parse.tasks.is_a?(Array) }

  asserts("Parse help") { topic.parse(["--help"]) }.equals 0
  asserts("Parse clone") { topic.parse(["--clone", "http://localhost/test"]).tasks }.same_elements [[:clone, "http://localhost/test"]]
end
