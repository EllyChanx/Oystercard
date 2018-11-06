class Oystercard
  attr_reader :balance, :entry_station, :exit_station
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @entry_station = entry_station
    @exit_station = exit_station
    @journey = {}
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end

  def touch_in(station)
    @in_use = true if @in_use == false
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
    @journey.store(:entry_station, station)
    @entry_station = station
    return station
  end

  def touch_out(station)
    @in_use = false if @in_use == true
    deduct(MINIMUM_FARE)
    @journey.store(:exit_station, station)
    @exit_station = station
    @entry_station = nil
	end

  def in_journey?
  	entry_station
    #entry_station variable is always empty (nil) since nothing is assigned
    # !nil return true; !!nil return false
  end

  def journey
    @journey
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
