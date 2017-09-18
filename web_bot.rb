require "net/http"
require "uri"

uri = URI.parse("http://xxx/login.php")

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data("username" => "test", "pass" => "test")
response = http.request(request)

#login olduktan sonra alınan cookie bilgisi ile ikinci bir sayafaya istek
#yapabilmek için gerekli olan tanımlama
puts cookies = response['set-cookie']

#puts response.body
#ikincil istek...
uri2 = URI.parse("http://xxx/test/users_index.php")
 http = Net::HTTP.new(uri2.host, uri2.port)
 request2 = Net::HTTP::Post.new(uri2.request_uri)

#ilk istekten donen cookie ile x sayfasına erişim...
request2['Cookie'] = cookies

response2 = http.request(request2)

 puts response2.body



