# frozen_string_literal: true

require_relative 'kolorit/version'

##
# Handle modules with color codes and methods to colorize string.
# Right module is included depending on user OS.
#
# @example (opt 1) - Require everything and override String class
#  require 'kolorit' => include color methods in class String
#
# @example (opt 2) - Require what you need, include where you need it
#  require 'kolorit/linux' => just require, no override
#  include Kolorit::Linux => use color methods in your class
#
# @example Colorize string
#  'I am mr Red String'.red
#  'I am mr Green String'.green
#  'I am bold (fat) mis Pink String'.pink.bold
#
# @example Available colors
#  red, green, yellow, blue, pink, cyan, gray
#
# @example Available styles
#  bold, italic, underline, blink, reverse_color
#
module Kolorit
  class << self
    def on_windows?
      if ENV['OS'] == 'Windows_NT'
        return false if RUBY_PLATFORM =~ /cygwin/
        true
      else
        false
      end
    end
    alias windows? on_windows?
  end
end

klass = String

if Kolorit.windows? && #!defined?(Kolorit::Windows)
  # still working on windows support
  #require_relative 'kolorit/windows'
  #klass.include Kolorit::Windows
  #raise StandardError, 'Windows not supported, yet!', []
elsif !defined?(Kolorit::Linux)
  require_relative 'kolorit/linux'
  klass.include(Kolorit::Linux)
end
