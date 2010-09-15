require './logger'
require 'eventmachine'
require 'protobuf/rpc/server'

$logger.info '[S] Setting up server'

EM.run do
	EM.add_periodic_timer(10) { puts '.' }
	EM.start_server '127.0.0.1', 9939, Protobuf::Rpc::Server
end