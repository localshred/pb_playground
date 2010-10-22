require 'eventmachine'
require './logger'
require 'eventmachine'
require 'protobuf/rpc/server'
require './user_service'

$logger.info '[S] Setting up server'

EM.run do
	EM.add_periodic_timer(20) { puts '.' }
	EM.start_server '127.0.0.1', 9939, Protobuf::Rpc::Server
end