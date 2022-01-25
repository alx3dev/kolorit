# frozen_string_literal: true

require_relative 'kolorit/version'

module Kolorit
  class << self
    def enable?() = @enable ||= false
    def enable!() = @enable = true
  end
end

case Gem::Platform.local.os
when 'linux', 'mac', 'osx'
  require_relative 'kolorit/linux'
  class String
    include Kolorit::Linux
    Kolorit.enable!
  end
when 'windows'
  # require_relative 'kolorit/windows'
  class String
    # working on windows color codes
  end
end

raise(StandardError, 'Kolorit not available for your OS', []) unless Kolorit.enable?
