require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.test_files = Dir.glob('**/*spec\.rb')
end

desc 'Run tests'
task :default => :test