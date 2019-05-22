class JourneyLog
  attr_reader :journeys

  def initialize(journey = Journey.new)
    @journeys = [journey]
  end

  def start(station)
    index = @journeys.count -1 
    @journeys[index].set_entry(station)
  end

  def finish(station)
    index = @journeys.count -1 
    @journeys[index].set_exit(station)
  end
 
  private
  
  def current_journey(journey = Journey.new)
    index = @journeys.count - 1
    @journeys[index].complete? ? @journeys.push(journey) : @journeys[index]
  end

end