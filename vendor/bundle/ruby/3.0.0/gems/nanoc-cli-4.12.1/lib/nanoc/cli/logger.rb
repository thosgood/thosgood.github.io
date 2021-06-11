# frozen_string_literal: true

module Nanoc
  module CLI
    # Nanoc::CLI::Logger is a singleton class responsible for generating
    # feedback in the terminal.
    #
    # @api private
    class Logger
      # Maps actions (`:create`, `:update`, `:identical`, `:cached`, `:skip` and `:delete`)
      # onto their ANSI color codes.
      ACTION_COLORS = {
        create: "\e[32m", # green
        update: "\e[33m", # yellow
        identical: '',    # (nothing)
        cached: '',       # (nothing)
        skip: '',         # (nothing)
        delete: "\e[31m", # red
      }.freeze

      include Singleton

      # Returns the log level, which can be :high, :low or :off (which will log
      # all messages, only high-priority messages, or no messages at all,
      # respectively).
      #
      # @return [Symbol] The log level
      attr_accessor :level

      def initialize
        @level = :high
        @mutex = Mutex.new
      end

      # Logs a file-related action.
      #
      # @param [:high, :low] level The importance of this action
      #
      # @param [:create, :update, :identical, :cached, :skip, :delete] action The kind of file action
      #
      # @param [String] name The name of the file the action was performed on
      #
      # @return [void]
      def file(level, action, name, duration = nil)
        log(
          level,
          format(
            '%s%12s%s  %s%s',
            ACTION_COLORS[action.to_sym],
            action,
            "\e[0m",
            duration.nil? ? '' : format('[%2.2fs]  ', duration),
            name,
          ),
        )
      end

      # Logs a message.
      #
      # @param [:high, :low] level The importance of this message
      #
      # @param [String] message The message to be logged
      #
      # @param [#puts] io The stream to which the message should be written
      #
      # @return [void]
      def log(level, message, io = $stdout)
        return if @level == :off
        return if @level != :low && @level != level

        @mutex.synchronize do
          io.puts(message)
        end
      end
    end
  end
end
