require 'slop'
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

        options.options = _parse(args, options)

        options.argv = args.clone
        args.clear

        options
      end

      private
      # Parser definition
      def _parse args, options
        opts = Slop.parse!(args, {help: true, strict: true}) do
          banner "Usage: #{$0} [options]"

          on :c, :clone, 'Clone from given URL',
             optional_argument: true do |url|
            options.tasks << [:clone, url]
          end

          on :i, :init, 'Init at given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:init, dir]
          end

          on :u, :update, 'Update the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:update, dir]
          end

          on :r, :repair, 'Repair the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:repair, dir]
          end

          on :commit, 'Commit the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:commit, dir]
          end

          on :p, :push, 'Push the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:push, dir]
          end

          on :v, :verbose, 'Enable verbose mode'

          on :version, 'Show version' do
            puts SixSync::VERSION
          end
        end

        opts
      end
    end
  end

  # Handles commandline parameters for the Network tool
  class NetworkOptions < Options
    class <<self
      private
      def _parse args, options
        opts = Slop.parse!(args, {help: true, strict: true}) do
          banner "Usage: #{$0} [options]"

          on :c, :clone, 'Clone from given URL',
             optional_argument: true do |url|
            options.tasks << [:clone, url]
          end

          on :i, :init, 'Init at given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:init, dir]
          end

          on :u, :update, 'Update the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:update, dir]
          end

          on :r, :repair, 'Repair the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:repair, dir]
          end

          on :commit, 'Commit the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:commit, dir]
          end

          on :p, :push, 'Push the given dir, or current dir if unspecified',
             optional_argument: true do |dir|
            dir = Dir.pwd if dir.nil?
            options.tasks << [:push, dir]
          end

          on :v, :verbose, 'Enable verbose mode'

          on :version, 'Show version' do
            puts SixSync::VERSION
          end
        end

        opts
      end
    end
  end
end
