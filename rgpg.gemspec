lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'rgpg/gem_info'

Gem::Specification.new do |s|
  s.name = 'rgpg'
  s.version = Rgpg::GemInfo.version_string
  s.date = Date.today rescue '1970-01-01'
  s.executables << 'rgpg'
  s.summary = 'rgpg'
  s.description = 'Simple Ruby wrapper around "gpg" command for file encryption'
  s.license = 'MIT'
  s.authors = 'Richard Cook'
  s.email = 'rcook@rcook.org'
  s.files = ['LICENSE'] + Dir.glob('lib/**/*.rb')
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/rcook/rgpg/'
end

