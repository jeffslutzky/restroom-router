# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PublicPark.delete_all

Adapters::RestroomParser.formatted_data.each do |data|    #iterate through each park (hash)
    sleep(0.11) #Geocoder gem only allows for 10 queries per second
    new_park = PublicPark.new(data)  
      name = new_park.name  
      location = new_park.location  
        latlng = Geocoder.search(location)  #use Geocoder gem to get geo information
        #latlng = latlng.first['geometry']['location']  #parse Geocoder gem output to get latitude and longitude 
        boroughs = ["Bronx County", "Kings County", "New York County", "Queens County", "Richmond County"]
        unless latlng.count < 1
          
    
          s_results = RecursiveOpenStruct.new(latlng.first.geometry['location'], :recurse_over_arrays => true)
            
          location_check = latlng.first.address_components.any? do |test|
             #test.values.include?("Bronx County", "Kings County", "New York County", "Queens County", "Richmond County")
          
             boroughs.each do |borough|
            test.has_value?(borough)
          end
           
           end
             if location_check

            new_park.latitude = s_results.lat
            new_park.longitude = s_results.lng
            new_park.save
          
        end
      end
  end
  


  #[5]["short_name"]