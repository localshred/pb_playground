require './proto/user.pb'
require './proto/user_service'
require './logger'

module Proto
	class UserService
	
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
			# TODO: implement create
		end
	
	end
end
