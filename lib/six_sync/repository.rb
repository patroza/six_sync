module SixSync
  ##
  # Repositories represent the combination of all components,
  # It's the master class that controls the others to perform actions on the repository
  class Repository
    # Default folder name of repository root
    DEFAULT_SYNC_DIRECTORY_NAME = ".sync"

    # Default folder name of archived content
    DEFAULT_PACK_DIRECTORY_NAME = ".pack"

    # Represents the status of the object
    attr_reader :status

    # Represents the repository root
    attr_reader :sync_directory

    # Represents the unarchived root
    attr_reader :working_directory

    # Represents the archived root
    attr_reader :pack_directory

    ##
    # Initializes the object
    #
    # === Attributes
    #
    # * +sync_directory+ - repository directory with configuration files, defaults to current_working_directory/{DEFAULT_SYNC_DIRECTORY_NAME}
    # * +working_directory+ - working directory with unarchived root, defaults to parent of sync_directory
    # * +pack_directory+ - working directory with archived root, defaults to sync_directory/{DEFAULT_PACK_DIRECTORY_NAME}
    def initialize sync_directory = nil, working_directory = nil, pack_directory = nil
      @sync_directory = sync_directory.nil? ?  ::File.join(::Dir.pwd, DEFAULT_SYNC_DIRECTORY_NAME) : sync_directory
      @working_directory = working_directory.nil? ? ::File.dirname(sync_directory) : working_directory
      @pack_directory = pack_directory.nil? ? ::File.join(sync_directory, DEFAULT_PACK_DIRECTORY_NAME) : pack_directory

      @status = :default
    end
  end
end
