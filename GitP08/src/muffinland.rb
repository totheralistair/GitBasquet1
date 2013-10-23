=begin MuffinLand is a content management application serving web requests.
From whatever source, web or not, it expects incoming data to be HTTP requests (GET or POST)
for now, it is tied to Rack type requests.
=end

$requests = Array.new
$sessions = Array.new
#wee note:     t1 = Time.now.strftime("%Y%m%d%H%M%S%L")
$muffins = Array.new


def ml_fresh_DB  # SCARY! USE ONLY FOR TESTING, NOT PRODUCTION!!
  $requests = Array.new
  out = $requests.size.to_s
end

def ml_add(request)
# i dont' understand cookies at all.
  if request.cookies.empty? ; response.set_cookie( "user_session", :value => "user 123") ;end
  $requests.push(request)
  out = ($requests.size - 1).to_s
end

def ml_at(location)
  req = $requests[ location ]
  out = req
end

def ml_path_at(location)
  req = ml_at( location ) # in theory, is a Rack request, but who really knows?
  path = req.env["PATH_INFO"]     # :( Rack dependency
  out = path
end

def ml_data_for_at( key, location)
  req = ml_at( location ) # in theory, is a Rack request, but who really knows?
  data = req.env["rack.request.form_hash"] [ key ] # :( Rack dependency
  out = data
end

