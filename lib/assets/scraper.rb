
require 'nokogiri'
require 'open-uri'
PAGE = "http://ruby006.students.flatironschool.com/"

html = Nokogiri.HTML(open(PAGE))


img = html.css("div.blog-thumb").

puts img


http://ruby006.students.flatironschool.com/img/students/kana_abe_index_profile.jpg
# src  = html.at('.profilePic img')['src']


# File.open("foo.png", "wb") do |f|
#   f.write(open(src).read)
# end
