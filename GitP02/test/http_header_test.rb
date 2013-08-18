require 'test/unit'
require 'net/http'
require 'uri'

class HeaderTest < Test::Unit::TestCase


  def test_init_conversation

    uri = URI('http://localhost:4567/foo')
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        # OK
      else
        res.value
    end


=begin
    uri = URI('http://localhost:4567/action')
    req = Net::HTTP::Post.new(uri)
    req.set_form_data('from' => '2005-01-01', 'to' => '2005-03-31')

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        # OK
      else
        res.value
    end
=end


=begin    port = ENV['PORT'] || '4567'

    uri = URI('http://localhost:4567')

    res = Net::HTTP.start(uri.host, uri.port ) do  |http|
      req = Net::HTTP::Get.new uri
      request = http.request(req)
      puts request.each_header do |key, value|
        puts 'key'
        puts "#{key} => #{value}"
      end


      query_data = "good stuff"
      post (query_data)

    end


    res.add_field('api-key', 'bow')
    res.each_header do |key, value|
      p "#{key} => #{value}"
    end
    puts res.body
    puts (res.code == '200' && res.body == 'Hello 12') ? 'OK' : 'FAIL'
=end


  end


end