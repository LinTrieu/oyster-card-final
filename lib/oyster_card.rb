class OysterCard

  attr_reader :balance

  def initialize 
    @balance = 0
  end

  def display_balance
    @balance
  end

  def top_up(money)
    @balance += money
  end

end
