task default: :cucumber

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |task|
    task.cucumber_opts = '--tags ~@wip'
  end
rescue LoadError
  task :cucumber do
    $stderr.puts 'Cucumber is disabled'
  end
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:demo) do |task|
    task.cucumber_opts = '--tags @demo'
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
