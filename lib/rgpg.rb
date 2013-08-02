if RUBY_VERSION < '1.9.0'
  require File.expand_path('../rgpg/gem_info', __FILE__)
  require File.expand_path('../rgpg/gpg_helper', __FILE__)
else
  require_relative 'rgpg/gem_info'
  require_relative 'rgpg/gpg_helper'
end

