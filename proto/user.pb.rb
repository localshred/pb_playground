require 'protobuf/message/message'
require 'protobuf/message/enum'
require 'protobuf/message/service'
require 'protobuf/message/extend'

module Proto
  class User < ::Protobuf::Message
    optional :string, :guid, 1
  end
  class UserList < ::Protobuf::Message
    repeated :User, :users, 1
  end
  class UserFindRequest < ::Protobuf::Message
    repeated :string, :guids, 1
  end
end