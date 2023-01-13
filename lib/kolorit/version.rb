# frozen_string_literal: true

# OS recognition.
# Check if we need **win32console** gem.
#
# Defined here because we need it in _.gemspec_ file.
#
module Kolorit
  # gem version
  VERSION = '0.2.1'

  class << self
    def win?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def linux?
      !win? && !mac?
    end

    def win_32_console?
      win? && cygwin?
    end

    def cygwin?
      (/cygwin/ =~ RUBY_PLATFORM) != nil
    end
  end
end
