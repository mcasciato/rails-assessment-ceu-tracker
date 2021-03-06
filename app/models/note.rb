class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :ceu

  accepts_nested_attributes_for :user, reject_if: :all_blank

  def self.most_recent
    order(created_at: :desc)
  end
end
