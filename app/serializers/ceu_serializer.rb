class CeuSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :location, :duration
end
