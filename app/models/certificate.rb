class Certificate < ActiveRecord::Base
  has_many :ceu_certificates
  has_many :ceus, through: :ceu_certificates
  validates :classification, presence: true

  accepts_nested_attributes_for :ceus, reject_if: :all_blank

end
