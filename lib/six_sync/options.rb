require 'cri'
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

        root_command = _parse(options)
        root_command.run(args)

        options.argv = args.clone
        args.clear

        options
      end

      private
      # Parser definition
      def _parse options
        #root_command = Cri::Command.new_basic_root
        root_command = Cri::Command.define do
          name        'six_sync'
          usage       'six_sync [options]'
          summary     'Managing and Distributing of SixSync repositories'
          description 'This command provides the basic functionality'


          option :h, :help, 'show help for this command' do |value, cmd|
            puts cmd.help
            exit 0
          end

          subcommand Cri::Command.new_basic_help

          flag nil, :version, 'Show version' do |value, cmd|
           puts SixSync.product_version
           exit 0
          end

          flag :v, :verbose, 'Verbose'
        end

        root_command.define_command do
          name    'clone'
          usage   'clone [URL] [options]'
          summary 'Clone a repository'
          aliases :c

          run do |opts, args, cmd|
            puts "Running Clone, #{opts}, #{args}, #{cmd}"
            options.tasks << [:clone, args[0] || Dir.pwd]
          end
        end

        root_command.define_command do
          name    'init'
          usage   'init [DIR] [options]'
          summary 'Init a repository'
          aliases :i

          run do |opts, args, cmd|
            puts "Running Init, #{opts}, #{args}, #{cmd}"
            options.tasks << [:init, args[0] || Dir.pwd]
          end
        end

        root_command.define_command do
          name    'update'
          usage   'update [DIR] [options]'
          summary 'Update a repository'
          aliases :u

          run do |opts, args, cmd|
            puts "Running update, #{opts}, #{args}, #{cmd}"
            options.tasks << [:update, args[0] || Dir.pwd]
          end
        end

        root_command.define_command do
          name    'repair'
          usage   'repair [DIR] [options]'
          summary 'Repair a repository'
          aliases :r

          run do |opts, args, cmd|
            puts "Running repair, #{opts}, #{args}, #{cmd}"
            options.tasks << [:repair, args[0] || Dir.pwd]
          end
        end

        root_command.define_command do
          name    'commit'
          usage   'commit [DIR] [options]'
          summary 'Commit a repository'
          #aliases :c

          run do |opts, args, cmd|
            puts "Running commit, #{opts}, #{args}, #{cmd}"
            options.tasks << [:commit, args[0] || Dir.pwd]
          end
        end

        root_command.define_command do
          name    'push'
          usage   'push [DIR] [options]'
          summary 'Push a repository'
          aliases :i

          run do |opts, args, cmd|
            puts "Running push, #{opts}, #{args}, #{cmd}"
            options.tasks << [:push, args[0] || Dir.pwd]
          end
        end

        root_command.add_command _parse_network_command(options)

        root_command
      end

      def _parse_network_command options
        network_command = Cri::Command.define do
          name    'network'
          usage   'network COMMAND [URL] [options]'
          aliases :n

          subcommand Cri::Command.new_basic_help

          run do |opts, args, cmd|
            puts "Running Network, #{opts}, #{args}, #{cmd}"
            options.tasks << [:clone, args[0] || Dir.pwd]
          end
        end

        network_command.define_command do
          name    'clone'
          usage   'clone [URL] [options]'
          summary 'Clone a network'
          aliases :c

          run do |opts, args, cmd|
            puts "Running Clone, #{opts}, #{args}, #{cmd}"
            options.tasks << [:clone, args[0] || Dir.pwd]
          end
        end

        network_command.define_command do
          name    'init'
          usage   'init [DIR] [options]'
          summary 'Init a network'
          aliases :i

          run do |opts, args, cmd|
            puts "Running Init, #{opts}, #{args}, #{cmd}"
            options.tasks << [:init, args[0] || Dir.pwd]
          end
        end

        network_command.define_command do
          name    'update'
          usage   'update [DIR] [options]'
          summary 'Update a network'
          aliases :u

          run do |opts, args, cmd|
            puts "Running update, #{opts}, #{args}, #{cmd}"
            options.tasks << [:update, args[0] || Dir.pwd]
          end
        end

        network_command.define_command do
          name    'repair'
          usage   'repair [DIR] [options]'
          summary 'Repair a network'
          aliases :r

          run do |opts, args, cmd|
            puts "Running repair, #{opts}, #{args}, #{cmd}"
            options.tasks << [:repair, args[0] || Dir.pwd]
          end
        end

        network_command.define_command do
          name    'commit'
          usage   'commit [DIR] [options]'
          summary 'Commit a network'
          #aliases :c

          run do |opts, args, cmd|
            puts "Running commit, #{opts}, #{args}, #{cmd}"
            options.tasks << [:commit, args[0] || Dir.pwd]
          end
        end

        network_command.define_command do
          name    'push'
          usage   'push [DIR] [options]'
          summary 'Push a network'
          aliases :i

          run do |opts, args, cmd|
            puts "Running push, #{opts}, #{args}, #{cmd}"
            options.tasks << [:push, args[0] || Dir.pwd]
          end
        end

        network_command
      end
    end
  end
end
