# frozen_string_literal: true

require_relative 'kolorit/version'

module Kolorit
end

os = nil
local_os = Gem::Platform.local.os

if local_os =~ /windows || Windows || Windows_NT/ 
  os = RUBY_PLATFORM =~ /cygwin/ ? :win : :x
else
  os = :x
end

raise(StandardError, 'Kolorit not available for your OS', []) if os.nil?

if os == :win
  # require_relative 'kolorit/windows'
  class String
    # working on windows color codes
  end
else
  require_relative 'kolorit/linux'
  class String
    include Kolorit::Linux
  end
end
