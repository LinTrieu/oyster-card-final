# This records the entry and exit station of a journey, and calculates its price
class Journey
  attr_reader :entry_station , :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def fare
    complete? ? valid_journey_fare : PENALTY_FARE
  end

  def valid_journey_fare
    crossed_zones + MINIMUM_FARE  
  end

  def crossed_zones
    (@entry_station.zone - @exit_station.zone).abs
  end

  def journey_hash
    { entry_station: @entry_station, exit_station: @exit_station }
  end

  def set_entry(entry_station)
    @entry_station = entry_station
  end

  def set_exit(exit_station)
    @exit_station = exit_station
  end

  def complete?
    !entry_station.nil? && !exit_station.nil?
  end
end
