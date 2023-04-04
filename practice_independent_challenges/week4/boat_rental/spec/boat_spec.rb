require 'spec_helper'

RSpec.describe Boat do
  before(:each) do
    @kayak = Boat.new(:kayak, 20) 
  end

  describe '#initialize' do
    it 'initializes' do
      expect(@kayak).to be_a(Boat)
    end

    it 'has attributes' do
      expect(@kayak.type).to eq(:kayak)
      expect(@kayak.price_per_hour).to eq(20)
      expect(@kayak.hours_rented).to eq(0)
    end
  end

  describe '#add hour' do
    it 'adds hours to hours rented' do
      @kayak.add_hour
      @kayak.add_hour
      @kayak.add_hour

      expect(@kayak.hours_rented).to eq(3)
    end
  end
end