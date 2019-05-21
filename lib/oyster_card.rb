class OysterCard

  attr_reader :balance 

  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
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

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def touch_in(entry_station)
    fail "Insufficient funds for journey" if insufficient_funds?
    @journey.set_entry(entry_station)
  end

  def touch_out(exit_station)
    @balance -= MINIMUM_FARE
    @journey.set_exit(exit_station)
  end



end
