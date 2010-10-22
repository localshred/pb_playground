require 'protobuf/rpc/client'
require './proto/user.pb'
require './user_service'
require './logger'

$logger.info '[c] setting up client'
request = Proto::UserFindRequest.new.tap do |req|
	req.guids << 'USER_GUID_1'
	req.guids << 'USER_GUID_2'
	req.guids << 'USER_GUID_3'
	req.guids << 'USER_GUID_4'
	req.guids << 'USER_GUID_5'
end

begin
  $logger.info '[c] before client.find [old]'
  Proto::UserService.client.find request do |client, response|
    $logger.info '[c] inside client callback'
  	if client.failed?
  		$logger.error '[c] Got client controller failure'
  		$logger.error client.error_message
  	else
  		$logger.info '[c] Got client OK response'
  		response.users.each do |user|
  			$logger.info '[c] user.guid = %s' % user.guid
  		end
  	end
  end
  $logger.info '[c] after client.find [old]'

  $logger.info '[c] ----'
  
  request = Proto::User.new
  request.guid = 'FAFA'

  $logger.info '[c] before client.find [new]'
  Proto::UserService.client.create request do |client|
    $logger.info '[c] inside client callback'
    
  	client.on_failure do |error|
  		$logger.error '[c] inside client on_error'
  		$logger.error error.code.name
  		$logger.error error.message
		end
		
		client.on_success do |user|
  		$logger.info '[c] inside client on_success'
			$logger.info '[c] user.guid = %s' % user.guid
  	end
  	
  end
  $logger.info '[c] after client.find [new]'

rescue
  $logger.error '[c] ERROR in calling client find request'
  $logger.error $!.message
  $logger.error $!.backtrace.join("\n")
end
$logger.info '[c] after client find'
