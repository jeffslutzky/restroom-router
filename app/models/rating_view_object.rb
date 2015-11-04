class RatingViewObject


  def initialize(park)
    @park = park 
  end

  def display_top_five_comments
    if !(@park.reviews.empty?)
      @park.reviews.first(5).map do |review|
        review.comment
      end
    else
      ["Be the first to rate and review this bathroom!"]
    end
  end

end