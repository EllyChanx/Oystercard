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
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @journey.entry(station)
  end

  def touch_out(station)
    @journey.exit(station)
    deduct(MINIMUM_FARE)
	end

  def in_use? #useless method, test purpose
    @journey.in_journey?
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
