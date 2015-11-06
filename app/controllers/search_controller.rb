class SearchController < ApplicationController

  def new
    @parks = PublicPark.all
    @my_location = Geocoder.search(params[:search][:location])

    if lat_lng = get_lat_lng(@my_location)
      @latitude = lat_lng.lat
      @longitude = lat_lng.lng
      @zoom_value = 16
      render 'public_parks/index.html.erb'
    else
      redirect_to root_path
    end
  end

  def get_lat_lng(arg1)
    boroughs = ["Bronx County", "Kings County", "New York County", "Queens County", "Richmond County"]

    if arg1.length > 0

      # get all values from geocoder results
      park_data = arg1.first.address_components.each_with_object([]) do |hash, all_values|
        all_values << hash.values
      end.flatten.uniq

      # return all values the 2 arrays have in common
      nyc_check = park_data & boroughs

      if nyc_check.length > 0
        parse_location = RecursiveOpenStruct.new(arg1.first.geometry['location'], :recurse_over_arrays => true)
        # parse Geocoder gem output to get latitude and longitude
      end
    end


  end


end
