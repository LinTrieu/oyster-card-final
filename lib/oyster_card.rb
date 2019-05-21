class OysterCard

  attr_reader :balance , :in_journey , :entry_station , :exit_station, :list_of_journeys

  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @list_of_journeys = []
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
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @in_journey = false
    @balance -= MINIMUM_FARE
    @exit_station = exit_station
    saves_journey
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def saves_journey
    @list_of_journeys << {entry_station: @entry_station, exit_station: @exit_station}
  end

end
