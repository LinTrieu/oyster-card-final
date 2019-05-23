require './lib/journey'

describe Journey do
  let(:journey)   {Journey.new}
  let(:station_bow)   {double(:station_bow, zone: 2, name: "Bow")}
  let(:station_bank)   {double(:station_bank, zone: 1, name: "Bank")}

  it 'by default is an incomplete journey' do  
    expect(journey).not_to be_complete
  end

  it 'knows if it is complete' do
    journey.set_entry(station_bow)
    journey.set_exit(station_bow)
    expect(journey).to be_complete
  end

  it 'knows if it is incomplete (tap out only)' do  
    journey.set_exit(station_bow)
    expect(journey).not_to be_complete
  end

  it 'knows if it is incomplete (tap in only)' do  
    journey.set_entry(station_bow)
    expect(journey).not_to be_complete
  end

  it 'charges a penalty fare if incomplete journey' do
    expect(journey.fare).to eq(Journey::PENALTY_FARE)
  end

  it 'charges a minimum fare if complete journey' do
    journey.set_entry(station_bow)
    journey.set_exit(station_bow)
    expect(journey.fare).to eq(Journey::MINIMUM_FARE)
  end

  it 'charges £2 fare for a 2 zone journey' do
    journey.set_entry(station_bow)
    journey.set_exit(station_bank)
    expect(journey.fare).to eq(2)
  end

  
end