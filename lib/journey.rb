# This records the entry station and exit station of a journey
class Journey

  attr_reader :entry_station , :exit_station

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
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
