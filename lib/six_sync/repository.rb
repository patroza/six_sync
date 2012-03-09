module SixSync
  # Repositories represent the combination of all components,
  # It's the master class that controls the others to perform actions on the repository
  class Repository
    # Default folder name of repository root
    DEFAULT_SYNC_DIRECTORY_NAME = ".sync"

    # Default folder name of archived content
    DEFAULT_PACK_DIRECTORY_NAME = ".pack"

    # Default format of archived content
    DEFAULT_ARCHIVE_FORMAT = "gz"

    # Represents the status of the object
    attr_reader :status

    # Represents the repository root
    attr_reader :sync_directory

    # Represents the unarchived root
    attr_reader :working_directory

    # Represents the archived root
    attr_reader :pack_directory

    # Format of archived content
    attr_accessor :archive_format

    # Versions of this repository
    attr_reader :versions

    # Initializes the object
    # @param [String] sync_directory Repository directory with configuration files, defaults to current_working_directory/{DEFAULT_SYNC_DIRECTORY_NAME}
    # @param [String] working_directory Working directory with unarchived root, defaults to parent of sync_directory
    # @param [String] pack_directory Pack directory with archived root, defaults to sync_directory/{DEFAULT_PACK_DIRECTORY_NAME}
    def initialize sync_directory = nil, working_directory = nil, pack_directory = nil
      @sync_directory = sync_directory.nil? ?  ::File.join(::Dir.pwd, DEFAULT_SYNC_DIRECTORY_NAME) : sync_directory
      @working_directory = working_directory.nil? ? ::File.dirname(@sync_directory) : working_directory
      @pack_directory = pack_directory.nil? ? ::File.join(@sync_directory, DEFAULT_PACK_DIRECTORY_NAME) : pack_directory

      @archive_format = DEFAULT_ARCHIVE_FORMAT

      @versions = []
      @status = :default
    end

    class << self
      # TODO: archive_format, sync/pack/working directory
      # Initialize an empty repository
      # @param [String] working_directory
      # @param [String] sync_directory
      # @param [String] pack_directory
      # @param [String] archive_format
      def init working_directory = nil, sync_directory = nil, pack_directory = nil, archive_format = nil
        repo = self.new sync_directory, working_directory, pack_directory
        archive_format = DEFAULT_ARCHIVE_FORMAT if archive_format.nil?
        repo.archive_format = archive_format
        repo
      end

      alias_method :old_clone, :clone

      # Clones a repository
      # @param [String] url (local or remote)
      # @param [String] working_directory
      # @param [String] sync_directory
      # @param [String] pack_directory
      def clone url, working_directory = nil, sync_directory = nil, pack_directory = nil, archive_format = nil
        # archive_format is determined by the remote
        repo = self.init working_directory, sync_directory, pack_directory
        #repo.remotes = url.split(",").map {|url| Remote.new url}
        #repo.update
        repo
      end
    end
  end
end
