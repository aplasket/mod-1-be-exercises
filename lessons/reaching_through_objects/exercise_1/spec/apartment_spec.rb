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
    end

    it 'checks rented status' do
      expect(@apartment.is_rented?).to eq(false)
    end

    it 'receives rent and updates rented status' do
      @apartment.rent
      expect(@apartment.is_rented?).to eq(true)
    end
  end
end