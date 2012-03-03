module SixSync
  # Remotes represent the repository on the remote side
  # and consist out of an url to the remote, a remote type, and properties
  class Remote
    # Represents the status of the object
    attr_reader :status

    # Initializes the object
    def initialize
      @status = :default
    end
  end
end
