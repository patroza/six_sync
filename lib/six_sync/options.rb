require 'optparse'
require 'ostruct'

module SixSync
  # Handles commandline parameters for the Main tool
  class Options
    class <<self
      # Parse given args
      # @param [Array] args Parse given args
      def parse args = ARGV
        options = OpenStruct.new
        options.tasks = []

        _parse(options).parse!(args)

        options.argv = args.clone
        args.clear

        options
      end

      private
      # Parser definition
      def _parse options
        OptionParser.new do |opts|
          opts.banner = "Usage: #{$0} [options]"
          opts.separator ""
          opts.separator "Specific options:"

          opts.on("-c", "--clone URL",
                  "Clone from given URL") do |url|
            options.tasks << [:clone, url]
          end

          opts.on("-i", "--init [DIR]",
                  "Init at given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:init, dir]
          end

          opts.on("-u", "--update [DIR]",
                  "Update the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:update, dir]
          end

          opts.on("-r", "--repair [DIR]",
                  "Repair the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:repair, dir]
          end

          opts.on("-c", "--commit [DIR]",
                  "Commit the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:commit, dir]
          end

          opts.on("-p", "--push [DIR]",
                  "Push the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:push, dir]
          end

          # Boolean switch.
          opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
            options.verbose = v
          end

          opts.separator ""
          opts.separator "Common options:"

          # No argument, shows at tail.  This will print an options summary.
          # Try it and see!
          opts.on_tail("-h", "--help", "Show this message") do
            puts opts
            exit
          end

          # Another typical switch to print the version.
          opts.on_tail("-v", "--version", "Show version") do
            puts SixSync::VERSION
            exit
          end
        end
      end
    end
  end

  # Handles commandline parameters for the Network tool
  class NetworkOptions < Options
    class <<self
      private
      def _parse options
        OptionParser.new do |opts|
          opts.banner = "Usage: #{$0} [options]"
          opts.separator ""
          opts.separator "Specific options:"

          opts.on("-c", "--clone URL",
                  "Clone from given URL") do |url|
            options.tasks << [:clone, url]
          end

          opts.on("-i", "--init [DIR]",
                  "Init at given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:init, dir]
          end

          opts.on("-u", "--update [DIR]",
                  "Update the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:update, dir]
          end

          opts.on("-r", "--repair [DIR]",
                  "Repair the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:repair, dir]
          end

          opts.on("-c", "--commit [DIR]",
                  "Commit the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:commit, dir]
          end

          opts.on("-p", "--push [DIR]",
                  "Push the given dir, or current dir if unspecified") do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:push, dir]
          end

          # Boolean switch.
          opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
            options.verbose = v
          end

          opts.separator ""
          opts.separator "Common options:"

          # No argument, shows at tail.  This will print an options summary.
          # Try it and see!
          opts.on_tail("-h", "--help", "Show this message") do
            puts opts
            exit
          end

          # Another typical switch to print the version.
          opts.on_tail("--version", "Show version") do
            puts SixSync::VERSION
            exit
          end
        end
      end
    end
  end
end
