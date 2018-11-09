require_relative "journey"
require_relative "journeylog"

class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
    @journeylog = JourneyLog.new
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if upper_limit?(amount)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    return deduct(@journey.fare) if in_use?
    @journey.entry(station)
  end

  def touch_out(station)
    @journey.exit(station)
    deduct(@journey.fare)
	end

  def in_use?
    @journey.in_journey?
  end

private

  def upper_limit?(amount)
    (amount + @balance) > MAXIMUM_BALANCE
  end

  def deduct(fare)
    @balance -= fare
  end


end
