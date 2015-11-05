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

class Restroom < ActiveRecord::Base
  has_many :reviews


  def average_rating
    if !(self.reviews.empty?)
      avg = self.reviews.average(:rating).to_f
      avg = avg.round(1)
      "#{avg}/10"
    else
      "Be the first to rate this restroom!"
    end
  end

end
