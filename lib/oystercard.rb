require_relative "journey"
require_relative "station"

class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    #@in_use = false
    @cur_journey = {}
    @journey_history = []
    @journey = Journey.new
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    @journey.in_station
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @cur_journey.store(:entry_station, station)
    @journey.in_journey?
  end

  def touch_out(station)
    @journey.leave_station
    deduct(MINIMUM_FARE)
    @cur_journey.store(:exit_station, station)
	end

  def in_use?
    @journey.in_journey?
  end

  # def in_journey?
  # 	@in_use
  #   #entry_station variable is always empty (nil) since nothing is assigned
  #   # !nil return true; !!nil return false
  # end

  def journey
    @journey_history << @cur_journey
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
