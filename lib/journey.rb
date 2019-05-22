class Journey

  attr_reader :list_of_journeys, :entry_station , :exit_station , :fare , :complete

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @list_of_journeys = []
  end

  def saves_journey
    @list_of_journeys << {entry_station: @entry_station, exit_station: @exit_station}
  end

  def set_entry(entry_station)
    @entry_station = entry_station
  end

  def set_exit(exit_station)
    @exit_station = exit_station
    saves_journey
  end

  def complete?
    @in_journey == false
  end

  # def fare
  #   !entry_station.nil? && !exit_station.nil? MINIMUM_FARE : PENALTY_FARE
  # end

end
