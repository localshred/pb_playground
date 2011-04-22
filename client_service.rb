require './proto/client_service'
require './logger'

module Proto
  class ClientService
	  located_at '127.0.0.1:9940'
  
    # request -> Proto::UserFindRequest
    # response -> Proto::UserList
    def find
      rpc_failed 'this came from the client service#find'
    end

  end
end
