require "rubygems"
require "sinatra"
 
ENV['RACK_ENV'] = "development"

require "frankie"
run Sinatra::Application