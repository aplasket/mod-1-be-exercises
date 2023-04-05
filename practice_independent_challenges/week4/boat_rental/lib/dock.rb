class Dock
  attr_reader :name,
              :max_rental_time,
              :rental_log,
              :returned_boats

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @returned_boats = {}
  end

  def rent(boat,renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    amount_charged = if boat.hours_rented <= @max_rental_time 
      boat.hours_rented * boat.price_per_hour
    else
      @max_rental_time * boat.price_per_hour
    end

        {:card_number => @rental_log[boat].credit_card_number,
         :amount => amount_charged}
  end

  def return(boat)
    @returned_boats[boat] = @rental_log[boat]
  end
end