class CeuSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :location, :duration, :certificate
  has_many :users
  has_many :notes
end
