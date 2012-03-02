require 'optparse'
require 'ostruct'

module SixSync
  ##
  # Handles commandline parameters
  class Options
    class <<self
      ##
      # Parse given args
      #
      # === Arguments
      #
      # * +args+ - Optional. Parse given args. Defaults to ARGV (commandline args)
      def parse args = ARGV
        options = OpenStruct.new
        options.tasks = []

        opts = OptionParser.new do |opts|
          opts.banner = "Usage: #{$0} [options]"
          opts.separator ""
          opts.separator "Specific options:"

          opts.on("-c", "--clone URL",
            "Clone from given URL") do |url|
            options.tasks << [:clone, url]
          end

          # No argument, shows at tail.  This will print an options summary.
          # Try it and see!
          opts.on_tail("-h", "--help", "Show this message") do
            puts opts
            return exit
          end
        end

        opts.parse!(args)

        options
      end
    end
  end
end
