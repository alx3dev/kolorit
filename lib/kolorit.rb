# frozen_string_literal: true

require_relative 'kolorit/version'

module Kolorit
end

if ENV['OS'] == 'Windows_NT'
  # working on windows color codes
  # require_relative 'kolorit/windows'
  # String.include Kolorit::Windows unless RUBY_PLATFORM =~ /cygwin/
else
  require_relative 'kolorit/linux'
  String.include(Kolorit::Linux)
end
