require "rake"
require "spec/rake/spectask"

desc "Run all specs"
Spec::Rake::SpecTask.new("spec") do |t|
  t.spec_files = FileList["spec//*.rb"]
end

#task :default do
#  Dir["test/**/*.rb"].sort.each { |test|  load test }
#end