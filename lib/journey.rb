class Journey

  PENALTY_FARE = 6

	def initialize
		@in_use = false
    @cur_journey = {}
    @journey_history = []
    @fare
	end

	def in_journey?
  	@in_use
  end

  def entry(station)
    return fare if @in_use == true
    @in_use = true
    @cur_journey.store(:entry_station, station)
  end

  def exit(station)
    return fare if @in_use == false
    @in_use = false
    @cur_journey.store(:exit_station, station)
  end

  def journey_history
    @journey_history << @cur_journey
  end

  def fare(amount = PENALTY_FARE)
    return amount
  end

end