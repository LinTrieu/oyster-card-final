class Journey

  attr_reader :in_journey , :list_of_journeys, :entry_station , :exit_station

  def initialize
    @in_journey = false
    @list_of_journeys = []
  end

  def saves_journey
    @list_of_journeys << {entry_station: @entry_station, exit_station: @exit_station}
  end

  # def in journey?
  # 
  # end

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