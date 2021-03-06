require 'protobuf/rpc/service'
require File.expand_path 'user.pb', File.dirname(__FILE__)

##	!! DO NOT EDIT THIS FILE !!
## 
##	To implement this service as defined by the protobuf, simply
##	reopen Proto::UserService and implement each service method:
## 
## module Proto
## 	class UserService
## 	
## 		# request -> Proto::UserFindRequest
## 		# response -> Proto::UserList
## 		def find
## 			# TODO: implement find
## 		end
## 	
## 		# request -> Proto::User
## 		# response -> Proto::User
## 		def create
## 			# TODO: implement create
## 		end
## 	
## 	end
## end
##

module Proto
	class UserService < Protobuf::Rpc::Service
	  rpc :find, UserFindRequest, UserList
	  rpc :create, User, User
	end
end
