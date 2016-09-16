class NoteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user, serializer: NoteUserSerializer
  has_one :ceu, serializer: NoteCeuSerializer
end
