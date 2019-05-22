class OysterCard

  attr_reader :balance , :in_journey

  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
    @in_journey = false
  end

  def display_balance
    @balance
  end

  def top_up(money)
    @balance += money
    raise "Top up limit exceeded" if @balance > DEFAULT_LIMIT
    @balance
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in(entry)
    fail "Insufficient funds for journey" if insufficient_funds?
    @journey.set_entry(entry)
    @in_journey = true
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def touch_out(exit)
    @balance -= @journey.fare
    @journey.set_exit(exit)
    @in_journey = false
  end

end
