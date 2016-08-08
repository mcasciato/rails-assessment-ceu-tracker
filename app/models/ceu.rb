class Ceu < ActiveRecord::Base
    belongs_to :user
    has_many :ceu_certificates
    has_many :certificates, through: :ceu_certificates

    validates :title, :date, :location, :duration, presence: true
end
