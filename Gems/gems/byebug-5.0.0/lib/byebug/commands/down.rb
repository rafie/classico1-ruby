# encoding: utf-8

require 'pathname'
require 'byebug/command'
require 'byebug/helpers/frame'
require 'byebug/helpers/parse'

module Byebug
  #
  # Move the current frame down in the backtrace.
  #
  class DownCommand < Command
    include Helpers::FrameHelper
    include Helpers::ParseHelper

    def regexp
      /^\s* down (?:\s+(\S+))? \s*$/x
    end

    def execute
      pos, err = parse_steps(@match[1], 'Down')
      return errmsg(err) unless pos

      adjust_frame(-pos, false)

      ListCommand.new(@state).execute if Setting[:autolist]
    end

    def description
      <<-EOD
        down[ count]

        Move to a lower frame in the stack trace.

        Use the "bt" command to find out where you want to go.
      EOD
    end
  end
end
