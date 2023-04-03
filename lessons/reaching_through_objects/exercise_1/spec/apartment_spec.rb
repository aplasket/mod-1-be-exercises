require 'spec_helper'

RSpec.describe Apartment do
  before(:each) do
    @apartment = Apartment.new
  end

  describe '#initialize' do
    it 'initializes' do
      expect(@apartment).to be_a(Apartment)
    end

    it 'has readable attributes' do
      expect(@apartment.rented).to eq(false)
      expect(@apartment.is_rented?).to eq(false)
    end
  end
end