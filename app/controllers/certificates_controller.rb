class CertificatesController < ApplicationController
  def create
    @certificate = Certificate.create(certificate_params)
  end

  private

  def certificate_params
    params.require(:certificate).permit(:classification, :ceu_ids => [], ceu_attributes: [:id])
  end
end
