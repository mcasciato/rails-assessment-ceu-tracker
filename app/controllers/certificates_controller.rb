class CertificatesController < ApplicationController
  def new
    @certificate = Certificate.new
  end
  
end
