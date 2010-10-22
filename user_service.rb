require './proto/user.pb'
require './proto/user_service'
require './logger'

module Proto
	class UserService
	  located_at 'localhost:9939'
	
		# request -> Proto::UserFindRequest
		# response -> Proto::UserList
		def find
			$logger.info '[S] in Proto::UserService#find'
			response.users = request.guids.map do |guid|
				Proto::User.new.tap do |user|
					user.guid = guid
				end
			end
		end
	
		# request -> Proto::User
		# response -> Proto::User
		def create
			$logger.info '[S] in Proto::UserService#create'
      # rpc_failed 'not implemented'
		end
	
	end
end
