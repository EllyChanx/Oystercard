require_relative "station"

class Journey

  # attr_accessor :in_use

	def initialize
		@in_use = false
		@in_station = false
	end

	def in_journey?
  	@in_station ? (@in_use = true) : (@in_use = false)
    @in_use
  end

  def in_station
  	@in_station = true
  end

  def leave_station
    @in_station = false
  end

end