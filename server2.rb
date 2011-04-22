require 'eventmachine'
require './logger'
require 'protobuf/rpc/server'
require './client_service'

Protobuf::Logger.configure :file => STDOUT, :level => ::Logger::INFO

$logger.debug '[S] Setting up server 2'

trap("INT") { $logger.info '[S] Server 2 shutting down'; EM.stop_event_loop }

EM.run do
	EM.start_server '127.0.0.1', 9940, Protobuf::Rpc::Server
end
