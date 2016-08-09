class Certificate < ActiveRecord::Base
  # belongs_to :user
  belongs_to :ceu
  validates :classification, presence: true

end
