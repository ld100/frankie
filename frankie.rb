require 'rubygems'
require 'sinatra'
require "lib/music_file"
require "lib/music_crawler"

require "config"

helpers do
  def secure_file_name(file_name)
    return name = file_name.strip().replace("/","")
  end
end

use Rack::Auth::Basic do |username, password|
  username == "music" && password == "lover"
end

def crawl(path)
  mc = MusicCrawler.new(path)
  mc.crawl_tracks
  @tracks = mc.tracks
  @subdirectories = mc.subdirectories

  port = request.port
  @host = "#{request.host}:#{port}"
end

get "/" do
  crawl(options.files_dir)
  @base_download_address = "http://#{@host}#{options.files_uri_prefix}"
  erb :index
end

get "/subdir/*" do
  sub_path = params[:splat].join
  crawl(options.files_dir + "/" + sub_path)
  @base_download_address = "http://#{@host}#{options.files_uri_prefix}/#{sub_path}"
  @parent = "#{sub_path}/"
  erb :index
end

get "/files/:file_name" do
  secure_file_name(params[:file_name])
end