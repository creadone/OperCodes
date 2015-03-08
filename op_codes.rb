require 'grape'
require 'phone'
require 'sqlite3'
require 'json'

class OpCodes < Grape::API
	format		:json
	prefix      'api'
  	version     'v1'
  	rescue_from :all

  	db = SQLite3::Database.new "codes.db"
  	query_result = []

	resource :code do
  		Phoner::Phone.default_country_code = '7'
  	  	
  	  	get '/is_valid' do
   	   		Phoner::Phone.valid?(params[:number])
  		end

  		get '/get_provider' do
  			query_result.clear

   	   		phone_number = Phoner::Phone.parse(params[:number])
   	   		db.execute( "SELECT * FROM numbers WHERE abcdef = #{phone_number.area_code.to_s} LIMIT 1") do |row|
  				query_result << row
			end
			
			query_result.flatten()
  		end

	end

   
end