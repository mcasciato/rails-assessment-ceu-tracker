class CeuSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :location, :duration, :certificate
end
