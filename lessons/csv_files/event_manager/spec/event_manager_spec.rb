require 'pry'
require 'rspec'
require './lib/attendee'
require '.lib/event_manager'

RSpec.describe EventManager do
  before(:each) do
    @event_1 = EventManager.new
    @person_1 = Attendee.new(1, "Allison", "Nguyen", "20010")
    @person_2 = Attendee.new(4, "David", "Thomas", "7306")
    @person_3 = Attendee.new(5, "Chris", "Sackett", nil)
    @person_4 = Attendee.new(7, "Mary Kate", "Curry", "212305")
  end

  it "exists and has attributes" do
    expect(@event_1).to be_an(Event)
    expect(@event_1.attendees).to be_an(Array)
  end

  it "starts with an empty array of attendees" do
    expect(@event_1.attendees).to be_an([])
  end

  it "can add attendees to array" do
    @event_1.add_attendee(@person_1)
    expect(@event_1.all_attendees).to eq([@person_1])
  end
end