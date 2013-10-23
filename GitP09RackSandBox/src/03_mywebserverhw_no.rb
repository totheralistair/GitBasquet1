# courtesy of http://sheeppond.wordpress.com/2010/09/24/project-002a-ruby-rack-tutorial-2/
# simple rack server tutorial

require 'socket'

webserver =   TCPServer.new('127.0.0.1', 7000)

while (session =   webserver.accept)
  session.print "<H1>Hello   World</H1>"
  session.close
end

# sigh, none of this works. browser doesn't find 127.0.0.1:7000