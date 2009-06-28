class MusicCrawler
  attr_accessor :tracks
  
  def initialize (directory, include_subridectories = false)
    @directory = directory
    @include_subridectories = include_subridectories
    @tracks = Array.new
  end
  
  def crawl_tracks
    dir = Dir.new(@directory)
    dir.each do |filename|
      if !File.directory?(filename) && ".mp3" == File.extname(filename)
        @tracks.push(MusicFile.new("#{@directory}/#{filename}"))
      end
    end
  end
  
  def subdirectories
    directories = Array.new
    Dir.new(@directory).each do |item|
      directories.push(item) if !File.directory?(item) && ".mp3" != File.extname(item)
    end
    return directories
  end

  protected
  def not_empty?
    dir = Dir.new(@directory)
    entries = dir.entries
    dir.close
    entries.delete(".")
    entries.delete("..")
    return true if entries.count > 2
    return false
  end
  
end