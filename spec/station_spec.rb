require './lib/station'

describe Station do

  let(:station)   {Station.new("name", 1)}

  it 'returns name of station' do
    expect(station.name).to eq("name")
  end

  it 'returns zone of station' do
    expect(station.zone).to eq(1)
  end

  
  
end