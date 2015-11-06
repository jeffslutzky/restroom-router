# == Schema Information
#
# Table name: public_parks
#
#  id                  :integer          not null, primary key
#  name                :string
#  location            :string
#  open_year_round     :string
#  handicap_accessible :string
#  borough             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  latitude            :float
#  longitude           :float
#  location_type       :string
#

class PublicPark < ActiveRecord::Base
  has_many :reviews
  # def self.gmaps_key
  #   keys = YAML.load_file('application.yml')
  #   key = keys['Google_API_Key']
  #   response = open("https://maps.googleapis.com/maps/api/js?key=#{key}&callback=initMap")
  #   hash = JSON.load(response)
    
  # end
  # PublicPark.gmaps_key

  def average_rating
    if !(self.reviews.empty?)
      avg = self.reviews.average(:rating).to_f
      avg = avg.round(1)
      "#{avg}/10"
    else
      "Be the first to rate this bathroom!"
    end
  end

end
