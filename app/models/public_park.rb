# == Schema Information
#
# Table name: public_parks
#
#  id                  :integer          not null, primary key
#  name                :string
#  location            :string
#  open_year_round     :boolean
#  handicap_accessible :boolean
#  borough             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PublicPark < ActiveRecord::Base
  
end
