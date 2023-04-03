require 'spec_helper'

RSpec.describe Room do
  before(:each) do
    @bathroom = Room.new("bathroom")
  end

   describe 'initialize' do
    it 'can initialize' do
      expect(@bathroom).to be_a(Room)
    end

    it 'has readable attributes' do
      expect(@bathroom.name).to eq("bathroom")
    end
  end
end