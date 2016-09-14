class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :occupation
  has_many :notes
end
