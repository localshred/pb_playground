require 'eventmachine'
require './logger'
require 'protobuf/rpc/server'
require './user_service.rb'

EM.run do
  $logger.info '[S] Setting up server at %s:%d' % [ Proto::UserService.host, Proto::UserService.port ]
  EM.error_handler { |error|
    puts error.message
  }
  EM.start_server Proto::UserService.host, Proto::UserService.port, Protobuf::Rpc::Server
end