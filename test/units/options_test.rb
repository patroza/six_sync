require 'teststrap'
require 'ostruct'

context "Options" do
  setup { SixSync::Options }

  asserts("Parse returns an OpenStruct") { topic.parse.is_a?(OpenStruct) }
  asserts("Parse tasks is Array") { topic.parse.tasks.is_a?(Array) }

  asserts("Parse clone") { topic.parse(["--clone", "http://localhost/test"]).tasks }.equals [[:clone, "http://localhost/test"]]
end
