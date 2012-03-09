require 'teststrap'

context "Remote" do
  URL = "http://localhost/test"

  setup { SixSync::Remote.new URL }

  asserts("Default Status") { topic.status == :default }

  asserts("URL") { topic.url }.equals URL
end
