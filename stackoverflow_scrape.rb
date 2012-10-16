require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'debugger'

print 'what type of job would you like to search: ' 
search_term = gets.chomp
search_term = search_term.split.join("+")

print 'how many miles from NYC would you like to search? '
range = gets.chomp

index_url = "http://careers.stackoverflow.com"
search_url = "/jobs?searchTerm=#{search_term}&location=new+york&range=#{range}"
search_results = Nokogiri::HTML(open("#{index_url}#{search_url}"))

#get all of the result pages if multiple pages
search_pages = []
search_results.css("div.pagination a").map do |link|
	search_pages << index_url + link["href"]
end

search_pages = search_pages.uniq!

job_links = []

search_pages.each do |page|
	doc = Nokogiri::HTML(open(page))
	doc.css("a.title").map do |link|
		job_links << index_url + link['href']
	end
end

job_links.each do |link|
	listings_page = Nokogiri::HTML(open(link.to_s))

	#company
	company_name = listings_page.css("div#hed a.employer").text

	#job titles
	job_title = listings_page.css("div#hed h1#title a.title").text

	#locations
	locations = listings_page.css("div#hed span.location").text

	#job description
	job_content = listings_page.css("div.jobdetail div.description")

	description = job_content[0].text.strip
	if job_content.length >= 2
		requirements = job_content[1].text
	elsif job_content.length > 2
		about = job_content[2].text
	end


end	