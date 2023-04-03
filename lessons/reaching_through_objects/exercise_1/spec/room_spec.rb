require 'pry'
require './lib/room.rb'

RSpec.describe Room do
  before(:each) do
    @bathroom = Room.new("bathroom")
    @bedroom = Room.new("bedroom")
    @kitchen = Room.new("kitchen")
  end

   describe 'initialize' do
    it 'can initialize' do
      expect(@bathroom).to be_a(Room)
    end

    it 'has readable attributes' do
      expect(@bathroom.name).to eq("bathroom")
      expect(@bedroom.name).to eq("bedroom")
    end
  end
end