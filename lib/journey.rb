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
    # @journeylog.start(station)
  end

  def exit(station)
    @in_use = false
    @exit_station = station
    # @journeylog.finish(station)
  end

  def completed?
    !!@entry_station && !!@exit_station
  end

  def fare(amount)
    return PENALTY_FARE unless completed?
    amount
  end

  def fare_cal
    return fare(1) if @entry_station.zone == @exit_station.zone
    return fare(2) if [@entry_station.zone, @exit_station.zone].max < 3
    return fare(3) if [@entry_station.zone, @exit_station.zone].min > 2
  end


end