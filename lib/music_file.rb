require "rubygems"
require "mp3info"
require "ruby-units"

class MusicFile
  attr_accessor :title, :artist, :album, :track_num, :year, :file_name, :size, :bitrate, :length

  def initialize(file_path)
    @path = file_path
    fetch_data if File.exist?(file_path)
  end

  protected
  def fetch_data
    @size = File.size(@path).to_unit("B").to("MB").round() #Transform bytes to megabytes
    @file_name = File.basename(@path)
    Mp3Info.open(@path) do |mp3|
      @title = mp3.tag.title
      @artist = mp3.tag.artist
      @album = mp3.tag.album
      @track_num = mp3.tag.tracknum
      @year = mp3.tag.year
      @bitrate = mp3.tag.bitrate
      @length = mp3.tag.length
    end
  end

end