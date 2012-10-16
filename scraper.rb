require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'debugger'

@db = SQLite::Database.open('scraped_jobs.db')

