class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :occupation
end
