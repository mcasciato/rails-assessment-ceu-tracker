class Ceu < ActiveRecord::Base
    has_one :certificate
    has_many :notes
    has_many :users, through: :notes

    validates :title, :date, :location, :duration, presence: true

    # accepts_nested_attributes_for :certificates, reject_if: :all_blank

    def certificate_attributes=(certificate_attributes)
      certificate_attributes.values.each do |certificate_attribute|
        certficate = Certificate.find_or_create_by(certificate_attribute)
        self.certificates << certficate
      end
    end
end
