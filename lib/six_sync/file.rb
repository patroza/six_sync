module SixSync
  ##
  # Files represent the objects within the repository
  # Usually consisting of a packed and unpacked equilevant
  class File
    # Represents the status of the object
    attr_reader :status

    ##
    # Initializes the object
    def initialize
      @status = :default
    end

    class <<self
      ##
      # Contains the registered subclasses file types
      def file_types; @@file_types ||= []; end

      ##
      # Verifies if the file_type is registered
      # === Attributes
      #
      # * +file_type+ - The file_type to lookup
      def has_file_type? file_type
        self.file_types.include?(SixSync.find_klass file_type, :File)
      end

      ##
      # Handles the registration of the subclasses
      def inherited subclass
        self.file_types << subclass
      end
    end
  end

  ##
  # Archived variant of an object
  class PackFile < File

  end

  ##
  # UnArchived variant of an object
  class WdFile < File

  end
end
