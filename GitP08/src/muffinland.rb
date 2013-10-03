=begin
MuffinLand is a content management application serving web requests.
From whatever source, web or not, it expects incoming data to be HTTP requests (GET or POST)
for now, it is tied to Rack type requests.
=end

$requests = Array.new  # yep, that's where they all go!

def ml_fresh_DB  # SCARY! USE ONLY FOR TESTING, NOT PRODUCTION!!
  $requests = Array.new
  out = $requests.size.to_s
end

def ml_add_request(request)
  $requests.push(request)
  out = ($requests.size - 1).to_s
end

def ml_request_at(location)
  req = $requests[ location ]
  out = req
end

def ml_request_path_at(location)
  req = ml_request_at( location ) # in theory, is a Rack request, but who really knows?
  path = req.env["PATH_INFO"]     # :( Rack dependency
  out = path
end

