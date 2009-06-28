require "rubygems"
require "sinatra"
 
ENV['RACK_ENV'] = "production"

require "frankie"
run Sinatra::Application