=begin
MuffinLand is a content management application serving web requests.
From whatever source, web or not, it expects incoming data to be HTTP requests (GET or POST)
for now, it is tied to Rack type requests.
=end

require_relative 'basquet'
require_relative 'ml_request'

$requestBasquet = Basquet.newPersistentBasquetPlease


# SCARY! Fresh_DB USE ONLY FOR TESTING, NOT PRODUCTION!!
def ml_fresh_DB
  $requestBasquet = Basquet.newPersistentBasquetPlease
  out = $requestBasquet.size.to_s
end

def ml_add_request(request)
  addedAt = $requestBasquet.zadd(request)
  out = addedAt.to_s
end

def ml_request_at(location)
  req = $requestBasquet.gimmeAt( location )
  out = req
end

def ml_path_at(location)
  rr = ml_request_at( location ) # in theory, is a Rack request, but who really knows?
  mlr = MLRequest.new( rr )      # this wrapper just to protect me from Rack one day
  path = mlr.path
  out = path
end

