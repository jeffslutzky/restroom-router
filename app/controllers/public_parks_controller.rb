class PublicParksController < ApplicationController

  def index
    @parks = PublicPark.all 
    @hash = {lat: PublicPark.first.latitude, lng: PublicPark.first.longitude}
  end

  def show
    @public_park = PublicPark.find(params[:id])
    @review = @public_park.reviews.build
  end

  def create

  end




end