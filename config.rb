configure :production, :test, :development do
  set :files_uri_prefix, "/files"
  set :require_auth, true
end

configure :production do
  set :files_dir, "/var/www/lab37.com/htdocs/m"
end

configure :development do
  set :files_dir, File.dirname(__FILE__) + "/public/files"
end

configure :test do
  set :files_dir, "/var/www/lab37.com/htdocs/m"
end
