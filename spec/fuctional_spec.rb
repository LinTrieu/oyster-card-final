require 'oyster_card'

  describe OysterCard do

    subject     { OysterCard.new }
    let(:bow)   { Station.new("Bow", 2) }
    let(:bank)   { Station.new("Bank", 2) }


    it 'taps into Bow and taps out of Bank' do
      subject.top_up(10)
      subject.touch_in(bow)
      expect{subject.touch_out(bank)}.to change{subject.balance}.by(-1)
    end 

    it 'taps into Bow and taps into Bank' do
      subject.top_up(10)
      subject.touch_in(bow)
      expect{subject.touch_in(bank)}.to change{subject.balance}.by(-6)
    end 

    it 'taps out Bow and taps out Bank' do
      subject.top_up(10)
      expect{ 
        subject.touch_out(bank)
        subject.touch_out(bow)
      }.to change{subject.balance}.by(-12)
    end 
  end