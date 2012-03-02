module SixSync
  ##
  # Repositories represent the combination of all components,
  # It's the master class that controls the others to perform actions on the repository
  class Repository
    # Represents the status of the object
    attr_reader :status

    ##
    # Initializes the object
    def initialize
      @status = :default
    end
  end
end
