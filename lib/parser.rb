require 'csv'
require 'awesome_print'
require 'sqlite3'

parsed_data = []
query_result = []
DATAPATH = 'data/phonecodes/'
CSVList = Dir.glob(DATAPATH+'*.csv')

db = SQLite3::Database.new "codes.db"

rows = db.execute <<-SQL
  create table numbers (
    abcdef int,
    start int,
    end int,
    capacity int,
    provider text(256),
    city text(256),
    region text(256) NULL,
    area text(256) NULL,
    area1 text(256) NULL
  );
SQL

CSVList.each do |file| 
  raw_data = File.open(file, 'r:windows-1251:utf-8').read
  csv = CSV.new(raw_data, 
    :quote_char=>'"',
    :header_converters => :symbol,
    :headers => true,
    :col_sep => ";",
    :force_quotes => true)
  csv.each do |line| 
    parsed_data << line.to_s.split(',').map!{ |z| z.include?('|') ? z.split('|') : z }.flatten(2)
  end
end

parsed_data.each do |pair|
  begin
    db.execute "insert into numbers values ( ?, ?, ?, ?, ?, ?, ?, ?, ?)", pair
  rescue Exception => e
    p e.message
  end
end