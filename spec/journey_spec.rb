require './lib/journey'

describe Journey do
  let(:journey)   {Journey.new}
  let(:station)   {double(:station)}

  it 'by default is incomplete' do  
    expect(journey).not_to be_complete
  end

  it 'knows if a journey is complete (tap in and tap out)' do
    journey.set_entry(station)
    journey.set_exit(station)
    expect(journey).to be_complete
  end

  it 'knows if a journey is incomplete (tap out only)' do  
    journey.set_exit(station)
    expect(journey).not_to be_complete
  end

  it 'knows if a journey is incomplete (tap in only)' do  
    journey.set_entry(station)
    expect(journey).not_to be_complete
  end

  it 'charges a penalty fare if incomplete journey' do
    expect(journey.fare).to eq(Journey::PENALTY_FARE)
  end

  it 'charges a minimum fare if complete journey' do
    journey.set_entry(station)
    journey.set_exit(station)
    expect(journey.fare).to eq(Journey::MINIMUM_FARE)
  end

end