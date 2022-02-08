# frozen_string_literal: true

require_relative 'kolorit/version' unless defined? Kolorit::VERSION

##
# Colorize terminal output without touching String class.
# Work for Linux and Mac, require `win32console` for Windows.
#
# @example Use it any way you like
#  require 'kolorit'
#
#  puts colorize :red, 'this is red string'
#
#  puts blue 'this is blue string'
#
#  puts 'this is green string'.green
#
#  puts cyan 'this is cyan string, make it bold!'.bold
#
# @see Kolorit::Linux
#
module Kolorit
end

if Kolorit.win? && !defined?(Kolorit::Windows)
  require_relative 'kolorit/windows'
  include(Kolorit::Windows)
elsif !defined?(Kolorit::Linux)
  require_relative 'kolorit/linux'
  include(Kolorit::Linux)
end
