require_relative 'basquet'

$basquet = Basquet.newPersistentBasquetPlease

def muffinland_home
  out = "Welcome to my iittle toy Basquet"
end

def muffinland_fresh_DB # GOOK: USE ONLY FOR TESTING, NOT PRODUCTION!!
  $basquet = Basquet.newPersistentBasquetPlease
  out = "New basquet w #{$basquet.size.to_s} items."
end

def muffinland_addGETRequest
#  if request.cookies.empty?
#    response.set_cookie( "user_session", :value => "user 123")
#  end
  addedAt = $basquet.zadd(request)
  out = "addGETRequest request stored at #{addedAt}"
end

def muffinland_addPOSTRequest
#  if request.cookies.empty?
#    response.set_cookie( "user_session", :value => "user 123")
#  end
  addedAt = $basquet.zadd(request)
  out = "addPOSTRequest request stored at #{addedAt}"
end

def muffinland_getRequestVerb_of_at(laBasquet, location)
  request = laBasquet.gimmeAt( location )
  out = request.env["PATH_INFO"]
end

