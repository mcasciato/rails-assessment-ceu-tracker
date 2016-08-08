class Certificate < ActiveRecord::Base
  belongs_to :user
  belongs_to :ceu
  validates :classification, presence: true

  accepts_nested_attributes_for :ceus, reject_if: :all_blank

end
