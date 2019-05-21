class OysterCard

  attr_reader :balance , :entry_station , :exit_station

  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
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

  def touch_in(entry_station)
    fail "Insufficient funds for journey" if insufficient_funds?
  end

  def touch_out(exit_station)
    @balance -= MINIMUM_FARE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

end
