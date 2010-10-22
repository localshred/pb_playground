require './proto/user.pb'
require './proto/user_service'
require './logger'

module Proto
	class UserService
<<<<<<< HEAD
	  located_at 'localhost:9939'
=======
	  located_at '0.0.0.0:9939'
>>>>>>> 833993ece1f53db0aa36c70d92c5cd8580db4dd9
	
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
