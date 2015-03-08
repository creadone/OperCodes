task :getdata do
	ruby "lib/downloader.rb"
	puts "Successful loaded"
end

task :parsedata do
	ruby "lib/parser.rb"
	puts "Parsed to SQLite"
end

task :run do 
	puts "Try to run service"
	exec("rackup")
	exit 0
end

task :install => [:getdata, :parsedata, :run] do
    puts "Running!"
end