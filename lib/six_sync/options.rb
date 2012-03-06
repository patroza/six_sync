require 'cri'
require 'ostruct'

module SixSync
  # Handles commandline parameters for the Main tool
  class Options
    class <<self
      # Parse given args
      # @param [Array] args Parse given args
      def parse args = ARGV
        _parse.run(args)
      end

      private
      # Parser definition
      def _parse
        #super_cmd = Cri::Command.new_basic_root # Bug with h self.help -> cmd.help etc
        super_cmd = Cri::Command.define do
          name        'six_sync'
          usage       'six_sync [options]'
          summary     'Managing and Distributing of SixSync repositories'
          description 'Provides Repository operations'


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

        super_cmd.define_command do
          name    'clone'
          usage   'clone URL [DIR] [options]'
          summary 'Clone a repository'
          aliases :c

          run do |opts, args, cmd|
            puts "Running Clone, #{opts}, #{args}, #{cmd}"
            if args.empty?
              puts "Missing URL"
              exit 1
            end

            url, dir = if args.size == 1
              [args[0], Dir.pwd]
                       else
              args
            end
            # SixSync.clone url, dir
          end
        end

        super_cmd.define_command do
          name    'init'
          usage   'init [DIR] [options]'
          summary 'Init a repository'
          aliases :i

          run do |opts, args, cmd|
            puts "Running Init, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.init dir
          end
        end

        super_cmd.define_command do
          name    'update'
          usage   'update [DIR] [options]'
          summary 'Update a repository'
          aliases :u

          run do |opts, args, cmd|
            puts "Running update, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.update dir
          end
        end

        super_cmd.define_command do
          name    'repair'
          usage   'repair [DIR] [options]'
          summary 'Repair a repository'
          aliases :r

          run do |opts, args, cmd|
            puts "Running repair, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.repair dir
          end
        end

        super_cmd.define_command do
          name    'commit'
          usage   'commit [DIR] [options]'
          summary 'Commit a repository'
          #aliases :c

          run do |opts, args, cmd|
            puts "Running commit, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.commit dir
          end
        end

        super_cmd.define_command do
          name    'push'
          usage   'push [DIR] [options]'
          summary 'Push a repository'
          aliases :i

          run do |opts, args, cmd|
            puts "Running push, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.push dir
          end
        end

        super_cmd.add_command _parse_network_command

        super_cmd
      end

      def _parse_network_command
        super_cmd = Cri::Command.define do
          name    'network'
          usage   'network COMMAND [URL] [options]'
          summary 'Setup and Manage custom networks'
          description 'Provides Network Repository operations'
          aliases :n

          subcommand Cri::Command.new_basic_help
        end

        super_cmd.define_command do
          name    'clone'
          usage   'clone URL [DIR] [options]'
          summary 'Clone a repository'
          aliases :c

          run do |opts, args, cmd|
            puts "Running Clone, #{opts}, #{args}, #{cmd}"
            if args.empty?
              puts "Missing URL"
              exit 1
            end

            url, dir = if args.size == 1
                         [args[0], Dir.pwd]
                       else
                         args
                       end
            # SixSync.clone url, dir
          end
        end

        super_cmd.define_command do
          name    'init'
          usage   'init [DIR] [options]'
          summary 'Init a repository'
          aliases :i

          run do |opts, args, cmd|
            puts "Running Init, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.init dir
          end
        end

        super_cmd.define_command do
          name    'update'
          usage   'update [DIR] [options]'
          summary 'Update a repository'
          aliases :u

          run do |opts, args, cmd|
            puts "Running update, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.update dir
          end
        end

        super_cmd.define_command do
          name    'repair'
          usage   'repair [DIR] [options]'
          summary 'Repair a repository'
          aliases :r

          run do |opts, args, cmd|
            puts "Running repair, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.repair dir
          end
        end

        super_cmd.define_command do
          name    'commit'
          usage   'commit [DIR] [options]'
          summary 'Commit a repository'
          #aliases :c

          run do |opts, args, cmd|
            puts "Running commit, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.commit dir
          end
        end

        super_cmd.define_command do
          name    'push'
          usage   'push [DIR] [options]'
          summary 'Push a repository'
          aliases :i

          run do |opts, args, cmd|
            puts "Running push, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            # SixSync.push dir
          end
        end

        super_cmd
      end
    end
  end
end
