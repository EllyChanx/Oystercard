require_relative "station"

class Journey

  PENALTY_FARE = 6

	def initialize
		@in_use = false
    @journeylog = JourneyLog.new
	end

	def in_journey?
  	@in_use
  end

  def entry(station)
    @in_use = true
    @entry_station = station
  end

  def exit(station)
    @in_use = false
    @exit_station = station
  end

  def completed?
    !!@entry_station && !!@exit_station
  end

  def fare
    return PENALTY_FARE unless completed?
    (@entry_station.zone - @exit_station.zone).abs + 1
  end


end