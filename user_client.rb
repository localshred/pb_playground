require 'protobuf/rpc/client'
require './proto/user.pb'
require './user_service'
require './logger'

$logger.info '[C] setting up client'
client = Protobuf::Rpc::Client.new Proto::UserService, 'localhost', 9938

request = Proto::UserFindRequest.new.tap do |req|
	req.guids << 'USER_GUID_1'
	req.guids << 'USER_GUID_2'
	req.guids << 'USER_GUID_3'
	req.guids << 'USER_GUID_4'
	req.guids << 'USER_GUID_5'
end

$logger.info '[C] calling client.find'
client.find request, Proto::UserList do |controller, response|
	if controller.failed?
		$logger.error 'Got client controller failure'
		$logger.error controller.error_message
	else
		$logger.info 'Got client OK response'
		response.users.each do |user|
			$logger.info 'user.guid = %s' % user.guid
		end
	end
end