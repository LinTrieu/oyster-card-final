require './lib/oyster_card'

describe OysterCard do
  let(:oyster_card)   {OysterCard.new}
  let(:station)       {double(:station_bow, zone: 2, name: "Bow")}
  
  before do
    oyster_card.top_up(10)
  end

  it 'can respond to a method that displays the balance' do
    expect(oyster_card).to respond_to(:display_balance)
  end

  it 'can get the current balance on the oyster card' do
    expect(oyster_card.display_balance).to eq(oyster_card.balance)
  end

  it 'balance can be topped up' do
    expect(oyster_card.top_up(10)).to eq(20)
  end

  it 'sets a limit of £90 on the card' do
    oyster_card.top_up(80)
    expect{oyster_card.top_up(1)}.to raise_error "Top up limit exceeded"
  end

  it 'can deduct a fare from the card' do
    oyster_card.top_up(80)
    expect(oyster_card.deduct(80)).to eq(oyster_card.balance)
  end

  it 'prevents oystercard touch_in with insufficient funds' do
    oyster_card = OysterCard.new
    expect{oyster_card.touch_in(station)}.to raise_error("Insufficient funds for journey")
  end

  it 'deducts minimum fare on touch_out' do
    oyster_card.touch_in(station)
    expect{oyster_card.touch_out(station)}.to change{oyster_card.balance}.by(-Journey::MINIMUM_FARE)
  end

end

