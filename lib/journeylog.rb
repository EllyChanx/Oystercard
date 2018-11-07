require_relative "journey"

class JourneyLog

  def initialize(journey_class = Journey.new )
    @journey_class = journey_class
    @journeys = []
  end

  

end