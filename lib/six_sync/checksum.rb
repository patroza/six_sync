module SixSync
  # Checksums represent the checksums of Files, usually in MD5 or SHA1 format
  class Checksum
    # Represents the status of the object
    attr_reader :status

    # Initializes the object
    def initialize
      @status = :default
    end

    class <<self
      # Contains the registered subclasses checksum types
      def checksum_types; @@checksum_types ||= []; end

      # Verifies if the checksum_type is registered
      # @param [Symbol] checksum_type The checksum_type to lookup
      def has_checksum_type? checksum_type
        self.checksum_types.include?(SixSync.find_klass checksum_type, :Checksum)
      end

      # Handles the registration of the subclasses
      def inherited subclass
        self.checksum_types << subclass
      end
    end
  end

  # Md5 variant of Checksum
  class Md5Checksum < Checksum

  end

  # Sha1 variant of Checksum
  class Sha1Checksum < Checksum

  end
end
