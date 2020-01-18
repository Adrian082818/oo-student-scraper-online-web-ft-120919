require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
  #       students_hash = []
  #   html = Nokogiri::HTML(open(index_url))
  #   html.css(".student-card").collect do |student|
  #     hash = {
  #       name: student.css("h4.student-name").text,
  #       location: student.css("p.student-location").text,
  #       profile_url: "http://students.learn.co/" + student.css("a").attribute("href")
  #     }
  #     students_hash << hash
    
  #   end
  #   students_hash
  html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_cards = doc.css(".student-card a")
    student_cards.collect do |element|
      {:name => element.css(".student-name").text ,
        :location => element.css(".student-location").text,
        :profile_url => element.attr('href')
      }
    end 
  end

  def self.scrape_profile_page(profile_url)
   html = open(profile_url)
   doc = Nokogiri::HTML(html)
   student_hash = {}
    social_url = doc.css(".vitals-container .social-icon-container a")
    social_url.each do |e|
      if e.attr.("href").include?()
end

