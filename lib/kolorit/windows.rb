# frozen_string_literal: true

require_relative 'version' unless defined? Kolorit::VERSION

module Kolorit
  module Windows
    begin
      raise RuntimeError, 'Windows require Cygwin' unless Kolorit.win_32_console?
      require 'win32console'
    rescue LoadError => e
      raise 'Run: $ gem install win32console' if e.message =~ /win32console/
      raise e.message
    end
    require_relative 'linux' unless defined? Kolorit::Linux
    include Kolorit::Linux
  end
end
