module SixSync
  class File
    attr_accessor :status
    def status
      :default
    end
  end

  class PackFile < File

  end

  class WdFile < File

  end
end
