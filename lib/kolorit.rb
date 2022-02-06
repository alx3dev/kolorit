# frozen_string_literal: true

require_relative 'kolorit/version'

##
# Colorize your terminal output. Work for Linux and Mac, if OS is windows - require `win32console`
# if platform is Cygwin or raise exception.
#
# @example Override **String** class with color methods
#  require 'kolorit'
#
#   'this is green string'.green
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
