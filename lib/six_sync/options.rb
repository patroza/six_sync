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
          usage       'six_sync [command] [options]'
          summary     'Managing and Distributing of SixSync repositories'
          description 'Provides Repository operations'


          option :h, :help, 'show help for this command' do |value, cmd|
            puts cmd.help
            exit 0
          end

          subcommand Cri::Command.new_basic_help

          option nil, :version, 'Show version' do |value, cmd|
           puts SixSync.product_version
           exit 0
          end

          flag :v, :verbose, 'Verbose'
        end

        super_cmd.define_command do
          name    'clone'
          usage   'clone URL [DIR] [options]'
          summary 'Clone a repository'
          description '[DIR] Defaults to current directory'
          aliases :c

          option :s, :sync_dir, 'Specify Sync directory. Defaults to DIR/.sync', :argument => :required
          option :p, :pack_dir, 'Specify Pack directory. Defaults to SYNC_DIR/.pack', :argument => :required

          run do |opts, args, cmd|
            puts "Running Clone, #{opts}, #{args}, #{cmd}"
            if args.empty?
              puts "Missing URL"
              exit 1
            end

            url, working_dir = if args.size == 1
              [args[0], Dir.pwd]
                       else
              args
            end
            Repository.clone url, working_dir, opts[:sync_dir], opts[:pack_dir]
          end
        end

        super_cmd.define_command do
          name    'init'
          usage   'init [DIR] [options]'
          summary 'Init a repository'
          description '[DIR] Defaults to current directory'
          aliases :i

          option :a, :archive_format, "Specify archive format. Defaults to #{SixSync::Repository::DEFAULT_ARCHIVE_FORMAT}", :argument => :required
          option :s, :sync_dir, 'Specify Sync directory. Defaults to DIR/.sync', :argument => :required
          option :p, :pack_dir, 'Specify Pack directory. Defaults to SYNC_DIR/.pack', :argument => :required

          run do |opts, args, cmd|
            puts "Running Init, #{opts}, #{args}, #{cmd}"
            working_dir = args.empty? ? Dir.pwd : args[0]
            Repository.init working_dir, opts[:sync_dir], opts[:pack_dir], opts[:archive_format]
          end
        end

        super_cmd.define_command do
          name    'update'
          usage   'update [DIR] [options]'
          summary 'Update a repository'
          description '[DIR] Defaults to current directory'
          aliases :u

          run do |opts, args, cmd|
            puts "Running update, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Repository.update dir
          end
        end

        super_cmd.define_command do
          name    'repair'
          usage   'repair [DIR] [options]'
          summary 'Repair a repository'
          description '[DIR] Defaults to current directory'
          aliases :r

          run do |opts, args, cmd|
            puts "Running repair, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Repository.repair dir
          end
        end

        super_cmd.define_command do
          name    'commit'
          usage   'commit [DIR] [options]'
          summary 'Commit a repository'
          description '[DIR] Defaults to current directory'
          #aliases :c

          run do |opts, args, cmd|
            puts "Running commit, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Repository.commit dir
          end
        end

        super_cmd.define_command do
          name    'push'
          usage   'push [DIR] [options]'
          summary 'Push a repository'
          description '[DIR] Defaults to current directory'
          aliases :i

          run do |opts, args, cmd|
            puts "Running push, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Repository.push dir
          end
        end

        super_cmd.add_command _parse_network_command

        super_cmd
      end

      def _parse_network_command
        super_cmd = Cri::Command.define do
          name    'network'
          usage   'network [command] [options]'
          summary 'Setup and Manage custom networks'
          description 'Provides Network Repository operations'
          aliases :n

          subcommand Cri::Command.new_basic_help
        end

        super_cmd.define_command do
          name    'clone'
          usage   'clone URL [DIR] [options]'
          summary 'Clone a repository'
          description '[DIR] Defaults to current directory'
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
            Network.clone url, dir
          end
        end

        super_cmd.define_command do
          name    'init'
          usage   'init [DIR] [options]'
          summary 'Init a repository'
          description '[DIR] Defaults to current directory'
          aliases :i

          option :a, :archive_format, 'Specify archive format', :argument => :required

          run do |opts, args, cmd|
            puts "Running Init, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Network.init dir
          end
        end

        super_cmd.define_command do
          name    'update'
          usage   'update [DIR] [options]'
          summary 'Update a repository'
          description '[DIR] Defaults to current directory'
          aliases :u

          run do |opts, args, cmd|
            puts "Running update, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Network.update dir
          end
        end

        super_cmd.define_command do
          name    'repair'
          usage   'repair [DIR] [options]'
          summary 'Repair a repository'
          description '[DIR] Defaults to current directory'
          aliases :r

          run do |opts, args, cmd|
            puts "Running repair, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Network.repair dir
          end
        end

        super_cmd.define_command do
          name    'commit'
          usage   'commit [DIR] [options]'
          summary 'Commit a repository'
          description '[DIR] Defaults to current directory'
          #aliases :c

          run do |opts, args, cmd|
            puts "Running commit, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Network.commit dir
          end
        end

        super_cmd.define_command do
          name    'push'
          usage   'push [DIR] [options]'
          summary 'Push a repository'
          description '[DIR] Defaults to current directory'
          aliases :i

          run do |opts, args, cmd|
            puts "Running push, #{opts}, #{args}, #{cmd}"
            dir = args.empty? ? Dir.pwd : args[0]
            Network.push dir
          end
        end

        super_cmd
      end
    end
  end
end
