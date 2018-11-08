require_relative "journey"

class JourneyLog

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
  	@cur_journey = {}
  	@cur_journey.store(:entry_station, station)
  end

  def finish(station)
  	@cur_journey.store(:exit_station, station)
  end

	def journey_history
    @journeys << @cur_journey
  end

private

  def current_journey
  	@cur_journey
  end

end