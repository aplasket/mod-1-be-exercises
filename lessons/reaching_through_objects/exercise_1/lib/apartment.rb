class Apartment
  attr_reader :rented, :rooms

  def initialize
    @rented = false
    @rooms = []
  end

  def is_rented?
    @rented
  end

  def rent
    @rented = true
  end

  def add_room(room_type)
    if @rooms.count < 4
      @rooms << room_type
    end
  end

  def list_rooms_by_name_alphabetically
    sorted_rooms = (@rooms.map {|room| room.name}).sort
  end


end