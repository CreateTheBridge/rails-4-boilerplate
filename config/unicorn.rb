worker_processes Integer(ENV['MAX_WORKER_PROCESSES'] || 3)
if ENV['IDE_PROCESS_DISPATCHER']
  timeout 30 * 60 * 60 * 24
else
  timeout 60
end
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  # Close any possible DB connections
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
  end

  # Destroy Redis Session if available
  if defined? Resque
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined? ActiveRecord::Base
    ActiveRecord::Base.establish_connection
  end

  if defined? Resque and !ENV['REDIS_URI'].blank?
    Resque.redis = ENV['REDIS_URI']
    Rails.logger.info('Connected to Redis')
  end
end
