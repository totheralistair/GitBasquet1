require_relative 'basquet'

$basquet = Basquet.newPersistentBasquetPlease

def muffinland_fresh_DB # GOOK: USE ONLY FOR TESTING, NOT PRODUCTION!!
  $basquet = Basquet.newPersistentBasquetPlease
  out = "New basquet w #{$basquet.size.to_s} items."
end

def muffinland_addGETRequest(request)
#  if request.cookies.empty?
#    response.set_cookie( "user_session", :value => "user 123")
#  end
  addedAt = $basquet.zadd(request)
  out = "addGETRequest request stored at #{addedAt}"
end

def muffinland_addPOSTRequest(request)
#  if request.cookies.empty?
#    response.set_cookie( "user_session", :value => "user 123")
#  end
  addedAt = $basquet.zadd(request)
  out = "addPOSTRequest request stored at #{addedAt}"
end

def muffinland_getRequestVerb_at(location)
  req = $basquet.gimmeAt( location )
#  #puts "1.", req.inspect
  out = req #for now just send the entire retrieved request back
#  #out = req["PATH_INFO"]
end

