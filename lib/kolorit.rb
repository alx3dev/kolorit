# frozen_string_literal: true

require_relative 'kolorit/version'

##
# Handle modules with color codes and methods to colorize string.
# Right module is included depending on user OS.
#
# @example Colorize string
#  'I am mr Red String'.red
#  'I am mr Green String'.green
#  'I am bold (fat) mis Pink String'.pink.bold
#
# @example Available colors
#  red, green, yellow, blue, pink, cyan, gray
#
# @example Available types
#  bold, italic, underline, blink, reverse_color
#
module Kolorit
end

klass = String

if ENV['OS'] == 'Windows_NT'
  # working on windows color codes
  # require_relative 'kolorit/windows'
  # klass.include Kolorit::Windows unless RUBY_PLATFORM =~ /cygwin/
else
  require_relative 'kolorit/linux'
  klass.include(Kolorit::Linux)
end
