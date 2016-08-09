class CeuCertificate < ActiveRecord::Base
  belongs_to :ceu
  belongs_to :certificate
end
