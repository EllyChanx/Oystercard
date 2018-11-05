class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
  	fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount > MAXIMUM_BALANCE)
    @balance += amount.to_i
  end
  
  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true if @in_use == false
    fail "Insufficient funds for journey" if @balance < MINIMUM_FARE
  end

  def touch_out
 		if @in_use == true
  		@in_use = false
  	end
	end

  def in_journey?
  	@in_use
  end

end
