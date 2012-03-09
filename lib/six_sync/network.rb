module SixSync
  # Represents a network of remotes with repositories
  class Network
    # Represents the status of the object
    attr_reader :status

    # Represents the root folder of the repository
    attr_reader :working_directory

    # Format of archived content
    attr_accessor :archive_format

    # Initializes the object
    def initialize working_directory = Dir.pwd
      @working_directory = working_directory
      @archive_format = Repository::DEFAULT_ARCHIVE_FORMAT
      @status = :default
    end
  end
end
