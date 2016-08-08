class Ceu < ActiveRecord::Base
    has_one :certificates
    has_many :users, through: :certificates

    validates :title, :date, :location, :duration, presence: true
end
