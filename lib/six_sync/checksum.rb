module SixSync
  class Checksum
    attr_accessor :status

    def status
      :default
    end
  end

  class Md5Checksum < Checksum

  end

  class Sha1Checksum < Checksum

  end
end
