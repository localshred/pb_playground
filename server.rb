require './logger'
require 'protobuf/rpc/server'

$logger.info '[S] Setting up server'
Protobuf::Rpc::Server.new Host: 'localhost', Port: 9939, Logger: $logger

loop do
	p '.'
	sleep 10
end