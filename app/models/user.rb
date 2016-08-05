class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :email, presence: true, uniqueness: true

  has_many :ceus
  has_many :ceu_certificates, through: :ceus
  has_many :certificates, through: :ceus
end
