module SixSync
  # Configuration holder and manager
  class Configuration
    # Represents the status of the object
    attr_reader :status

    # Initializes the object
    def initialize
      @status = :default
    end
  end
end
