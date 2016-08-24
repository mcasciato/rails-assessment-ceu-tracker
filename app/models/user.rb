class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

    validates :name, :email, presence: true, uniqueness: true

    has_many :notes
    has_many :ceus, through: :notes

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
            user.name = auth.info.name
            user.password = Devise.friendly_token[0, 20]
        end
    end

    def last_login
        last_sign_in_at.localtime.strftime('%m/%d/%Y at %I:%M %p')
    end
end
