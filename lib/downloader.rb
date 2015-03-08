require 'open-uri'

DATAPATH = 'data/phonecodes/'

data_list = %w(
  http://www.rossvyaz.ru/docs/articles/Kody_ABC-3kh.csv
  http://www.rossvyaz.ru/docs/articles/Kody_ABC-4kh.csv
  http://www.rossvyaz.ru/docs/articles/Kody_ABC-8kh.csv
  http://www.rossvyaz.ru/docs/articles/Kody_DEF-9kh.csv
  )
  
def get_filename_of url
  uri = URI.parse(url)
  File.basename(uri.path)
end

data_list.each do |url|
  begin
    open(DATAPATH + get_filename_of(url), 'wb') do |file|
      file << open(url).read
    end
  rescue Exception => e
   puts e.message
  end
end