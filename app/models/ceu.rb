class Ceu < ActiveRecord::Base
    has_many :notes
    has_many :users, through: :notes

    scope :most_recent, -> { order(date: :desc) }

    validates :title, :date, :location, :duration, :certificate, presence: true

    def last_modified
      updated_at.localtime.strftime("%m/%d/%Y at %I:%M %p")
    end

end
