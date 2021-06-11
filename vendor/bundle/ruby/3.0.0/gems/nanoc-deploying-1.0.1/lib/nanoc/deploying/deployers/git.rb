# frozen_string_literal: true

module Nanoc
  module Deploying
    module Deployers
      # A deployer that deploys a site using [Git](https://git-scm.com).
      #
      # @example A deployment configuration for GitHub Pages:
      #
      #   deploy:
      #     default:
      #       kind:       git
      #       remote:     git@github.com:myself/myproject.git
      #       branch:     gh-pages
      #       forced:     true
      #
      class Git < ::Nanoc::Deploying::Deployer
        identifier :git

        module Errors
          class Generic < ::Nanoc::Core::Error
          end

          class OutputDirDoesNotExist < Generic
            def initialize(path)
              super("The directory to deploy, #{path}, does not exist.")
            end
          end

          class OutputDirIsNotAGitRepo < Generic
            def initialize(path)
              super("The directory to deploy, #{path}, is not a Git repository.")
            end
          end

          class RemoteDoesNotExist < Generic
            def initialize(remote)
              super("The remote to deploy to, #{remote}, does not exist.")
            end
          end

          class BranchDoesNotExist < Generic
            def initialize(branch)
              super("The branch to deploy, #{branch}, does not exist.")
            end
          end
        end

        def run
          unless File.exist?(source_path)
            raise Errors::OutputDirDoesNotExist.new(source_path)
          end

          remote = config.fetch(:remote, 'origin')
          branch = config.fetch(:branch, 'master')
          forced = config.fetch(:forced, false)

          puts "Deploying via Git to branch “#{branch}” on remote “#{remote}”…"

          Dir.chdir(source_path) do
            unless File.exist?('.git')
              raise Errors::OutputDirIsNotAGitRepo.new(source_path)
            end

            # Verify existence of remote, if remote is not a URL
            if remote_is_name?(remote)
              begin
                run_cmd(%W[git config --get remote.#{remote}.url])
              rescue TTY::Command::ExitError
                raise Errors::RemoteDoesNotExist.new(remote)
              end
            end

            # If the branch exists then switch to it, otherwise prompt the user to create one.
            begin
              run_cmd_unless_dry(%W[git checkout #{branch}])
            rescue TTY::Command::ExitError
              raise Errors::BranchDoesNotExist.new(branch)
            end

            return if clean_repo?

            msg = "Automated commit at #{Time.now.utc} by Nanoc #{Nanoc::VERSION}"
            author = 'Nanoc <>'
            run_cmd_unless_dry(%w[git add -A])
            run_cmd_unless_dry(%W[git commit -a --author #{author} -m #{msg}])

            if forced
              run_cmd_unless_dry(%W[git push -f #{remote} #{branch}])
            else
              run_cmd_unless_dry(%W[git push #{remote} #{branch}])
            end
          end
        end

        private

        def remote_is_name?(remote)
          remote !~ /:\/\/|@.+:/
        end

        def run_cmd(cmd, dry_run: false)
          TTY::Command.new(printer: :null).run(*cmd, dry_run: dry_run)
        end

        def run_cmd_unless_dry(cmd)
          run_cmd(cmd, dry_run: dry_run)
        end

        def clean_repo?
          TTY::Command.new(printer: :null).run('git status --porcelain').out.empty?
        end
      end
    end
  end
end
