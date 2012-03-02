module SixSync
  class Checksum
    attr_accessor :status

    class <<self
      def checksum_types; @@checksum_types ||= []; end
      def has_checksum_type? checksum_type
        self.checksum_types.include?(SixSync.const_get "#{checksum_type.capitalize}Checksum")
      end

      def inherited subclass
        self.checksum_types << subclass
      end
    end

    def status
      :default
    end
  end

  class Md5Checksum < Checksum

  end

  class Sha1Checksum < Checksum

  end
end
