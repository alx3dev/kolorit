# frozen_string_literal: true

require_relative 'kolorit/version'

module Kolorit
end

if ENV['OS'] == 'Windows_NT'
  # require_relative 'kolorit/windows'
  class String
    # working on windows color codes
    # include Kolorit::Windows unless RUBY_PLATFORM =~ /cygwin/
  end
else
  require_relative 'kolorit/linux'
  class String
    include Kolorit::Linux
  end
end
