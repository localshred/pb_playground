require 'protobuf/rpc/client'
require './proto/user.pb'
require './user_service'
require './logger'

$logger.info '[C] setting up client request'

request = Proto::UserFindRequest.new.tap do |req|
	req.guids << 'USER_GUID_1'
	req.guids << 'USER_GUID_2'
	req.guids << 'USER_GUID_3'
	req.guids << 'USER_GUID_4'
	req.guids << 'USER_GUID_5'
end

begin
  $logger.info '[C] calling client.find to server %s:%d' % [Proto::UserService.host, Proto::UserService.port]
  Proto::UserService.client.find request do |client, response|
  	if client.failed?
  		$logger.error 'Got client failure'
  		$logger.error client.error_message
  	else
  		$logger.info 'Got client OK response'
  		response.users.each do |user|
  			$logger.info 'user.guid = %s' % user.guid
  		end
  	end
  end
rescue
  $logger.error 'Error happened when calling user service client find method'
  $logger.error $!.message
  $logger.error $!.backtrace.join("\n")
end