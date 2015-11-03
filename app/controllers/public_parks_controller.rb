class PublicParksController < ApplicationController

  def index
    # PublicPark.all.map do |park|
    #   park.latitude
    #   binding.pry
    @parks = PublicPark.all 
    @hash = {lat: PublicPark.first.latitude, lng: PublicPark.first.longitude}

    
  end


end