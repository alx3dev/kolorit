# frozen_string_literal: true

module Kolorit
  # gem version
  VERSION = '0.2.0-dev'

  ##
  # Check if we need **win32console** gem.
  # Defined here because we need it in _.gemspec_ file.
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
  end
end
