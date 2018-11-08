class Journey

  PENALTY_FARE = 6

	def initialize
		@in_use = false
    @fare
    @journeylog = JourneyLog.new
	end

	def in_journey?
  	@in_use
  end

  def entry(station)
    return fare if @in_use == true
    @in_use = true
    @journeylog.start(station)
    # @cur_journey.store(:entry_station, station)
  end

  def exit(station)
    return fare if @in_use == false
    @in_use = false
    @journeylog.finish(station)
    # @cur_journey.store(:exit_station, station)
  end

  def fare(amount = PENALTY_FARE)
    return amount
  end

end