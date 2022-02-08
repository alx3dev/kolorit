# frozen_string_literal: true

module Kolorit
  # gem version
  VERSION = '0.2.0'

  ##
  # Check if we need **win32console** gem.
  # Defined here because we need it in _.gemspec_ file.
  #
  # Check either to puts/print or just return colorized string
  #
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

    def enable(param = true)
      @enable = param.is_a? TrueClass
    end
    alias enable= enable

    def disable
      enable false
    end

    def output?
      @output
    end

    def output(settings = :puts)
      @output = settings
      @output = nil if settings.is_a? FalseClass
      @output = :puts if settings.is_a? TrueClass
    end
    alias output= output
  end
end
