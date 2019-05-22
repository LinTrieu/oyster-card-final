class Journey

  attr_reader :list_of_journeys, :entry_station , :exit_station

  def initialize

    @list_of_journeys = []
  end

  def saves_journey
    @list_of_journeys << {entry_station: @entry_station, exit_station: @exit_station}
  end

  def set_entry(entry_station)
    @entry_station = entry_station
    @in_journey = true
  end

  def set_exit(exit_station)
    @exit_station = exit_station
    @in_journey = false
    saves_journey
  end
end