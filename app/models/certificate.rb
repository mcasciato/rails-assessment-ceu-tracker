class Certificate < ActiveRecord::Base
  has_many :ceu_certificates
  validates :type, presence: true
end
