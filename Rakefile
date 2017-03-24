task default: :cucumber

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new do |task|
    tags = ENV.fetch('TAGS', '@static_topology,@failure_recovery')
    no_internet_tag = tags.split(',').include?('@internet') ? '' : "--tags '~@internet' "
    task.cucumber_opts = "--tags '~@wip' #{no_internet_tag}--tags '#{tags}'"
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
