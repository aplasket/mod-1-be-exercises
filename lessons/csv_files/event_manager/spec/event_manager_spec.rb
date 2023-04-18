require 'pry'
require 'rspec'
require './lib/attendee'
require './lib/event_manager'

RSpec.describe EventManager do
  before(:each) do
    @event = EventManager.new("./data/event_attendees.csv")
  end

  it "exists and has attributes" do
    expect(@event).to be_an(EventManager)
  end
  
  it "creates an array of attendees objects" do
    expect(@event.attendees).to be_an(Array)
    @event.attendees.each do |attendee|
      expect(attendee).to be_an(Attendee)
    end
  end

  it "can count number of attendees in array" do
    expect(@event.attendees.count).to eq(19)
  end

  it 'can create an array of attendees with correct info' do
    expect(@event.attendees.first.id).to eq("1")
    expect(@event.attendees.first.name).to eq("Allison Nguyen")
    expect(@event.attendees.first.zipcode).to eq("20010")
  end

end