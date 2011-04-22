require 'eventmachine'
require './logger'
require 'protobuf/rpc/server'
require 'protobuf/common/logger'
require './user_service'

$logger.debug '[S] Setting up server 1'
Protobuf::Logger.configure :file => STDOUT, :level => ::Logger::INFO

trap("INT") { $logger.info '[S] Server 1 shutting down'; EM.stop_event_loop }

EM.run do
  $logger.debug '[S] starting'
	EM.start_server '127.0.0.1', 9939, Protobuf::Rpc::Server
  $logger.debug '[S] after start'
end
