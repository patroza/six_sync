module SixSync
  class File
    attr_accessor :status

    class <<self
      def file_types; @@file_types ||= []; end
      def has_file_type? file_type
        self.file_types.include?(SixSync.const_get "#{file_type.capitalize}File")
      end

      def inherited subclass
        self.file_types << subclass
      end
    end

    def status
      :default
    end
  end

  class PackFile < File

  end

  class WdFile < File

  end
end
