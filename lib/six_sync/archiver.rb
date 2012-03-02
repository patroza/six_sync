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
  end
end