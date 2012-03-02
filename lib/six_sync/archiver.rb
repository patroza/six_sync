module SixSync
  ##
  # Archivers represent archive formats and associated tools to create and unpack these archives
  class Archiver
    # Represents the status of the object
    attr_reader :status

    ##
    # Initializes the object
    def initialize
      @status = :default
    end

    class <<self
      ##
      # Contains the registered subclasses checksum types
      def archiver_types; @@archiver_types ||= []; end

      ##
      # Verifies if the archiver_type is registered
      #
      # === Attributes
      #
      # * +archiver_type+ - The archiver_type to lookup
      def has_archiver_type? archiver_type
        self.archiver_types.include?(SixSync.find_klass archiver_type, :Archiver)
      end

      ##
      # Handles the registration of the subclasses
      def inherited subclass
        self.archiver_types << subclass
      end
    end
  end

  ##
  # 7zip Archiver
  class Zip7Archiver < Archiver

  end

  ##
  # Gzip Archiver
  class GzipArchiver < Archiver

  end
end
