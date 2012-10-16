require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'debugger'

print 'what type of job would you like to search: ' 
search_term = gets.chomp
search_term = search_term.split.join("+")

print 'how many miles would you like to search? '
range = gets.chomp

#create index for website
index_page = Nokogiri::HTML(open("http://careers.stackoverflow.com"))

#open search page
search_page = Nokogiri::HTML(open("http://careers.stackoverflow.com/jobs?searchTerm=#{search_term}&location=new+york&range=#{range}"))

#open job listings page
listings_page = Nokogiri::HTML(open())

