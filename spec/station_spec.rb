require './lib/station'

describe Station do

  let(:station)   {Station.new("name", 1)}

  it 'returns name of station' do
    expect(station.name).to eq("name")
  end

  it 'returns zone of station' do
    expect(station.zone).to eq(1)
  end


  def saves_journey
    @list_of_journeys << {entry_station: @entry_station, exit_station: @exit_station}
  end
  
end