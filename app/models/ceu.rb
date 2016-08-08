class Ceu < ActiveRecord::Base
    has_many :certificates
    has_many :users, through: :certificates

    validates :title, :date, :location, :duration, presence: true

    # accepts_nested_attributes_for :certificates, reject_if: :all_blank

end
