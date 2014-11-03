require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative '../../config/environment'


class Scraper
  attr_accessor :student_htmls, :full_page_html

  def initialize
  end

  def scrape_page #=> full page of html
    Nokogiri.HTML(open(Student::PAGE))
  end

  def parse_students #=> select html for all students
    full_page_html = self.scrape_page
    full_page_html.css("li.home-blog-post")
  end

  def parse_student_name(html) #=> "name"
    html.css("div.big-comment h3 a").text
  end

  def parse_student_image(html) #=> "image path"
    html.css("div.blog-thumb a img").map {|img| img["src"]}[0]
  end

  def create_students #=> saves each student in DB w/ name and image path
    student_htmls = parse_students
    student_htmls.each do |student_html|
      if parse_student_name(student_html) != "Joe Lehr" && parse_student_name(student_html) != "Iris Abramson"
        @student = Student.new
        @student.name = parse_student_name(student_html)
        @student.image = parse_student_image(student_html)
        @student.save
      end
    end
  end

end


# Student.all.each do |student|
#   puts "#{student.id}"
#   puts "#{student.name}"
#   puts "#{student.image}"
# end


  # student_html = html.css("li.home-blog-post")

  # img = student_html.css("div.blog-thumb a img")[1]['src']

  # name = student_html.css("div.big-comment h3 a")[1].text
