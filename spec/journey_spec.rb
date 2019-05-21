require 'journey'

describe Journey do

  let(:journey)   {Journey.new}
  let(:station)   {double(:station)}

  it 'can track whether the user has touched in and is in journey' do
    journey.set_entry(station)
    expect(journey.in_journey).to eq(true) 
  end

  it 'stores a list_of_journeys' do
    journey.set_entry(station)
    journey.set_exit(station)
    expect(journey.list_of_journeys).to include({entry_station: station, exit_station: station})
  end

  it 'can track whether the user has touched out' do
    journey.set_exit(station)
    expect(journey.in_journey).to eq(false)
  end

end