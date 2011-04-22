require 'protobuf/rpc/client'
require './proto/user.pb'
require './user_service'
require './logger'

Protobuf::Logger.configure :file => STDOUT, :level => ::Logger::INFO

# $logger.debug '[c] setting up client'
request = Proto::UserFindRequest.new.tap do |req|
	req.guids << 'USER_GUID_1'
	req.guids << 'USER_GUID_2'
	req.guids << 'USER_GUID_3'
	req.guids << 'USER_GUID_4'
	req.guids << 'USER_GUID_5'
end

# begin
  # $logger.debug '[c] before client.find [new]'
  Proto::UserService.client.find request do |client|
    # $logger.debug '[c] inside client callback'
    
  	client.on_failure do |error|
      $logger.debug '[c] inside client on_error'
  		$logger.debug error.code.name
  		$logger.debug error.message
		end
		
		client.on_success do |user|
  		$logger.debug '[c] inside client on_success'
			$logger.debug '[c] user.guid = %s' % user.guid
  	end
  	
  end
  # $logger.debug '[c] after client.find [new]'

# rescue
  # $logger.error '[c] ERROR in calling client find request'
  # $logger.error $!.message
  # $logger.error $!.backtrace.join("\n")
# end
