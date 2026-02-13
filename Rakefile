require "rake/testtask"

Rake::TestTask.new("test:ruby") do |t|
  t.libs << "test/ruby"
  t.test_files = FileList["test/ruby/**/*_test.rb"]
end

Rake::TestTask.new("test:integration") do |t|
  t.libs << "test/integration"
  t.test_files = FileList["test/integration/**/*_test.rb"]
end

desc "Run all tests"
task test: ["test:ruby", "test:integration"]

task default: :test
