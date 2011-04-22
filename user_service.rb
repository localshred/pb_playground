require './proto/user.pb'
require './proto/user_service'
require './client_service'
require './logger'

module Proto
	class UserService
	  located_at '127.0.0.1:9939'
	
		# request -> Proto::UserFindRequest
		# response -> Proto::UserList
		def find
		  self.async_responder = true
			$logger.debug '[S] in Proto::UserService#find'
			$logger.debug '[S] calling client service find'
		  Proto::ClientService.client(async: true).find(request) do |c|
        c.on_success do |s|
          $logger.debug '[S] in client.on_success for ClientService#find = %s' % s.inspect
    			response.users = request.guids.map do |guid|
    				Proto::User.new.tap do |user|
    					user.guid = guid
    				end
    			end
    			send_response
        end
        
        c.on_failure do |e|
          $logger.debug '[S] in client.on_failure for ClientService#find = %s' % e.inspect
          rpc_failed e
        end
	    end
		end
	
		# request -> Proto::User
		# response -> Proto::User
		def create
			$logger.debug '[S] in Proto::UserService#create'
      # rpc_failed 'not implemented'
		end
	
	end
end
