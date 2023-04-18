# ./lib/event_manager.rb
require "csv"

class EventManager
  attr_reader :attendees

  def initialize(csv)
    @attendees = (CSV.open csv, headers: true, header_converters: :symbol).map do |row|
      attendee = Attendee.new(
        row[:id],
        row[:first_name],
        row[:last_name],
        row[:zipcode],
      )
    end
  end
end
