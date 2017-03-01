# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
class AsyncExecutor
  def initialize(host:, result_file:, stderr_file: nil, initial_wait: 3, process_wait: 1)
    @host = host
    @result_file = result_file
    @stderr_file = stderr_file
    @initial_wait = initial_wait
    @process_wait = process_wait
  end

  def exec(command)
    @thread = Thread.start do
      begin
        if @result_file.nil? then
          if @stderr_file.nil? then
            @host.exec "#{command}"
          else
            @host.exec "#{command} 2> #{@stderr_file}"
          end
        else
          if @stderr_file.nil? then
            @host.exec "#{command} 1> #{@result_file}"
          else
            @host.exec "#{command} 1> #{@result_file} 2> #{@stderr_file}"
          end
        end
        sleep @process_wait
      rescue => e
        STDERR.puts e
      end
    end
    sleep @initial_wait
  end

  def join()
    @thread.join
  end 
end
