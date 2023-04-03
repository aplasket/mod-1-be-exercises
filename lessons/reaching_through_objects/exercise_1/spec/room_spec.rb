require 'pry'
require './lib/room.rb'

RSpec.describe Room do
   describe 'initialize' do
    it 'can initialize' do
      bathroom = Room.new("bathroom")

      expect(bathroom).to be_a(Room)
    end

    it 'has readable attributes' do
      bathroom = Room.new("bathroom")
      
      expect(bathroom.name).to eq("bathroom")
    end
  end
end