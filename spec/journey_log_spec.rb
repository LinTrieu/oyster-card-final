require './lib/journey_log'

describe JourneyLog do
  let(:station) { double :station }
  let(:log)     { JourneyLog.new }

  it { should respond_to(:start).with(1).argument }

  it 'should start a new journey with an entry station' do
    log.start(station)
    journey = log.journeys[0]
    expect(journey.entry_station).to eq(station)
  end

  it 'should start a new journey with an entry station' do
    log.finish(station)
    journey = log.journeys[0]
    expect(journey.exit_station).to eq(station)
  end

  # cannot test private method
  # it 'current_journey should return an incomplete journey by default' do
  #   log.start(station)
  #   expect(log.current_journey).to eq(log.list[0])
  # end

end