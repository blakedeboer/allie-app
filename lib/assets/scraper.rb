require 'nokogiri'
require 'open-uri'
require_relative '../../config/environment'


PAGE = "http://ruby006.students.flatironschool.com/"

html = Nokogiri.HTML(open(PAGE))

student_html = html.css("li.home-blog-post")

img = student_html.css("div.blog-thumb a img")[0]['src']

name = student_html.css("div.big-comment h3 a")[0].text

@student = Student.new
@student.name = name
@student.image = img
@student.save

puts "#{@student.id}"
puts "#{@student.name}"
puts "#{@student.image}"


# src  = html.at('.profilePic img')['src']


# File.open("foo.png", "wb") do |f|
#   f.write(open(src).read)
# end

