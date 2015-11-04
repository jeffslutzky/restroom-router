class PublicParksController < ApplicationController

  def index
    @parks = PublicPark.all 
    @hash = {lat: PublicPark.first.latitude, lng: PublicPark.first.longitude}
  end


end