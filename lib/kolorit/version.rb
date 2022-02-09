# frozen_string_literal: true

#
# Check if we need **win32console** gem.
# Defined here because we need it in _.gemspec_ file.
#
# Check either to puts/print or just return colorized string.
# Disable/Enable globally.
#
module Kolorit
  # gem version
  VERSION = '0.2.0'

  class << self
    def win_32_console?
      win? && cygwin?
    end

    def win?
      ENV['OS'] == 'Windows_NT'
    end

    def cygwin?
      RUBY_PLATFORM =~ /cygwin/
    end

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
