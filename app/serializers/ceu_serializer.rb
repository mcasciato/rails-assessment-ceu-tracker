class CeuSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :location, :duration, :certificate
  # has_one :user, serializer: CeuUserSerializer
end
