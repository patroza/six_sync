module SixSync
  # Represents a network of remotes with repositories
  class Network
    # Represents the status of the object
    attr_reader :status

    # Initializes the object
    def initialize
      @status = :default
    end
  end
end
