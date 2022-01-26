# frozen_string_literal: true

require_relative 'lib/kolorit/version'

Gem::Specification.new do |spec|
  spec.name = 'kolorit'
  spec.version = Kolorit::VERSION
  spec.authors = ['alx3dev']
  spec.email = ['alx3dev@gmail.com']

  spec.summary = 'Colorize terminal output. Linux-Mac only, Windows CLI coming soon.'
  spec.description = <<~DESCRIPTION
    Print your terminal output in different colors. Early development stage,
    for now only Linux and Mac. MIT license.
  DESCRIPTION
  spec.homepage = 'https://www.github.com/alx3dev/kolorit'
  spec.license = 'MIT'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.required_ruby_version = '>= 2.6.0', '< 4.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"
  spec.metadata['documentation_uri'] = "https://rubydoc.info/gems/#{spec.name}/#{spec.version}"
  spec.metadata['license_uri'] = "#{spec.homepage}/LICENSE"

  spec.files = %w[lib/kolorit.rb
                  lib/kolorit/version.rb
                  lib/kolorit/linux.rb]

  spec.bindir = 'bin'
  spec.require_paths = 'lib'
end
