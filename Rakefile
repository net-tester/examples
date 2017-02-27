task default: :cucumber

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |task|
    tags = ENV.fetch('TAGS', '@@static,@dynamic')
    task.cucumber_opts = "--tags '~@wip' --tags '#{tags}'"
  end
rescue LoadError
  task :cucumber do
    $stderr.puts 'Cucumber is disabled'
  end
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  task :rubocop do
    $stderr.puts 'RuboCop is disabled'
  end
end
