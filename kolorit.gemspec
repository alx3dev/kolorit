# frozen_string_literal: true

require_relative 'lib/kolorit/version'

Gem::Specification.new do |spec|
  spec.name = 'kolorit'
  spec.version = Kolorit::VERSION
  spec.authors = ['alx3dev']
  spec.email = ['alx3dev@gmail.com']

  spec.summary = 'Colorize terminal output on Linux, Mac and Windows.'
  spec.description = <<~DESCRIPTION
    Colorize terminal output without touching core classes.
    Work for Linux and Mac, require `win32console` for Windows.
    Use on any class, auto #puts or #print, with power of ruby blocks.
  DESCRIPTION
  spec.homepage = 'https://www.github.com/alx3dev/kolorit'
  spec.license = 'MIT'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.required_ruby_version =  '~> 3'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"
  spec.metadata['documentation_uri'] = "https://rubydoc.info/gems/#{spec.name}/#{spec.version}"

  spec.files = %w[lib/kolorit.rb
                  lib/kolorit/linux.rb
                  lib/kolorit/windows.rb
                  lib/kolorit/version.rb
                  LICENSE
                  README.md]

  spec.bindir = 'bin'
  spec.require_paths = 'lib'

  spec.add_runtime_dependency 'win32console', '~> 1.3' if Kolorit.win_32_console?

  spec.add_development_dependency 'bundler', '~> 2.3'
  spec.add_development_dependency 'rake', '~> 13.0'
end
