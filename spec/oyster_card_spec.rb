require './lib/oyster_card'

describe OysterCard do

  it 'can respond to a method that displays the balance' do
    oyster_card = OysterCard.new
    expect(oyster_card).to respond_to(:display_balance)
  end

  it 'can get the current balance on the oyster card' do
    oyster_card = OysterCard.new
    expect(oyster_card.display_balance).to eq(oyster_card.balance)
  end

end
