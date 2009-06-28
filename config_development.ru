require 'rubygems'
require 'sinatra'
 
Sinatra::Application.default_options.merge!(
  :run => false,
  :env => :development
)
 
require 'frankie'
run Sinatra.application