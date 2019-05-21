require 'lib/journey'

describe Journey do

  let(:journey)   {Journey.new}

  it 'can track whether the user has touched in and is in journey' do
      oyster_card.touch_in(station)
      expect(oyster_card.in_journey).to eq(true) 
    end

    it 'stores a list_of_journeys' do
      oyster_card.touch_in(station)
      oyster_card.touch_out(station)
      expect(oyster_card.list_of_journeys).to include({entry_station: station, exit_station: station})
    end



end