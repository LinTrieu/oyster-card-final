class OysterCard

  attr_reader :balance , :in_journey, :list_of_journeys

  DEFAULT_LIMIT = 90

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
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

  def touch_in(entry)
    fail "Insufficient funds for journey" if insufficient_funds?
    @journey.set_entry(entry)
    @in_journey = true
  end

  def insufficient_funds?
    @balance < Journey::MINIMUM_FARE
  end
  
  def touch_out(exit)
    @journey.set_exit(exit)
    @balance -= @journey.fare
    @in_journey = false
  end

  def saves_journey
    @list_of_journeys << @journey.journey_hash
  end
  
end

