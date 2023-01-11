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
  class << self
    def enabled?
      @enable != false
    end

    def enable(color: true)
      @enable = color.is_a? TrueClass
    end
    alias enable= enable

    def disable
      enable color: false
    end

    def output?
      return false unless %i[puts print].include? @output
      @output
    end

    def output(settings = :puts)
      @output = if [nil, true, :puts].include? settings
                  :puts
                else
                  settings
                end
    end
    alias output= output
  end
end

raise('Unknown OS') unless (Kolorit.win? || Kolorit.mac? || Kolorit.linux?)

if Kolorit.win? && !defined?(Kolorit::Windows)
  require_relative 'kolorit/windows'
  include(Kolorit::Windows)
elsif !defined?(Kolorit::Linux)
  require_relative 'kolorit/linux'
  include(Kolorit::Linux)
end
