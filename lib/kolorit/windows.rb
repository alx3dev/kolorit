# frozen_string_literal: true

require_relative 'version' unless defined? Kolorit::VERSION

module Kolorit
  ##
  # Require `win32console` to work on windows 10.
  #
  module Windows
    begin
      raise StandardError, 'Windows require Cygwin' unless Kolorit.win_32_console?

      require 'win32console'
    rescue LoadError => e
      raise 'Run: $ gem install win32console' if e.message =~ /win32console/

      raise e.message
    end
    # Windows without cygwin is not supported, so if we come this far,
    # include Linux color codes.
    require_relative 'linux' unless defined? Kolorit::Linux
    include Kolorit::Linux
  end
end
