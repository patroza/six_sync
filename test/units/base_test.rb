context "Base" do
  setup { SixSync }

  asserts("Find klass") { topic.find_klass :File }
end
