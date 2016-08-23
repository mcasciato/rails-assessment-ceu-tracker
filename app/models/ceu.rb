class Ceu < ActiveRecord::Base
    has_one :certificate
    has_many :notes
    has_many :users, through: :notes

    scope :most_recent, -> { order(date: :desc) }

    validates :title, :date, :location, :duration, presence: true

    accepts_nested_attributes_for :certificate, reject_if: :all_blank

    def last_modified
      updated_at.localtime.strftime("%m/%d/%Y at %I:%M %p")
    end

    def certificate_attributes=(certificate_attributes)
      certificate_attributes.each do |certificate_attribute|
        certficate = Certificate.create(certificate_attribute)
        self.certificate << certficate
      end
    end

    def add_new_certificate(params)
      new_certificate = params[:certificate]
        Certificate.create(ceu_id: self.id, user_id: self.id, name: new_certificate)
    end

    def associate_certificate_to_ceu(params)
      if params[:certificate_ids]
        params[:certificate_ids].each do |x|
          Certificate.create(ceu_id: self.id, user_id: self.id, name: Certificate.find_by_id(x).name)
        end
      end
    end
  end
