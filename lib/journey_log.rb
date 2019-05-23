class JourneyLog
  attr_reader :journeys

  def initialize(journey = Journey.new)
    @journeys = [journey]
  end

  def start(station)
    @journeys.last.set_entry(station)
  end

  def finish(station)
    @journeys.last.set_exit(station)
  end
 
  private
  
  def current_journey(journey = Journey.new)
    @journey.last.complete? ? @journeys.push(journey) : @journeys[index]
  end
end