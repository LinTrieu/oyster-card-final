# This is where we hold the balance, top up and pays for travel, and stores a list of journeys
class OysterCard

  attr_reader :balance , :list_of_journeys

  DEFAULT_LIMIT = 90

  def initialize
    @balance = 0
    @journey = Journey.new
    @list_of_journeys = []
  end

  def display_balance
    @balance
  end

  def top_up(money)
    raise "Top up limit exceeded" if @balance + money > DEFAULT_LIMIT
    @balance += money
  end

  def deduct(money = @journey.fare)
    @balance -= money
  end

  def touch_in(entry)
    fail "Insufficient funds for journey" if insufficient_funds?
    @journey = Journey.new
    @journey.set_entry(entry)
  end

  def insufficient_funds?
    @balance < Journey::MINIMUM_FARE
  end
  
  def touch_out(exit)
    @journey.set_exit(exit)
    deduct
    saves_journey
  end

  def saves_journey
    @list_of_journeys << @journey.journey_hash
  end
end

