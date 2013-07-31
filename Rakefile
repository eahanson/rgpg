require 'rake'
require 'rake/testtask'

task :default => [:test, :build]

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :build do
  result = system('gem build rgpg.gemspec')
  raise RuntimeError.new('gem build failed') unless result
end

