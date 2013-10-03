=begin
ML_Request is a wrapper of Rack requests
cuz right now ML only understands Rack structured requests
=end

require 'rack'

class MLRequest

  def initialize(aRackRequest)
    @req = aRackRequest
  end

  def path
    @req.env["PATH_INFO"]
  end

end