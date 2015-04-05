require 'socket'
def web
	puts "Website? (EG: google.com)"
	host = gets.chomp
	port = 80
	puts "File? (EG: /index.html)"
	path = gets.chomp
	
	request = "GET #{path} HTTP/1.0\r\n\r\n"
	
	socket = TCPSocket.open(host,port)  
	socket.print(request)               
	response = socket.read
	
	headers,body = response.split("\r\n\r\n", 2) 
    body.gsub! '<', ''
    body.gsub! '>', ''
    body.gsub! '<p>', ''
    body.gsub! '<h1>', ''
    body.gsub! '<html>', ''
    body.gsub! '<b>', ''
    body.gsub! '</p>', ''
    body.gsub! '</h1>', ''
    body.gsub! '</html>', ''
    body.gsub! '</b>', ''
	print body
	puts ""
	web
end

web
