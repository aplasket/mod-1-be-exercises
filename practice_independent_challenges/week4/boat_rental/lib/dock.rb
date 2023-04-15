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

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    # {:card_number => 'renter.cc-n', :amount => charge_total}
    # amount = boat.price_per_hour * boat.hours_rented
    # however if hours_rented >= max_rental_time, the 
    # amount = boat.price_per_hour * max_rental_time
    # require 'pry'; binding.pry
    if boat.hours_rented >= @max_rental_time
      amount_charged = boat.price_per_hour * @max_rental_time
    else
      amount_charged = boat.price_per_hour * boat.hours_rented
    end

    charge_total = {
      :card_number => @rental_log[boat].credit_card_number,
      :amount => amount_charged
    }
  end

  def return(boat)
    @returned_boats[boat] = @rental_log[boat]
  end

  def log_hour
    @rental_log.each_key do |boat| 
      if !@returned_boats.include?(boat)
        boat.add_hour
      end
    end
  end

  def revenue
    # returns total revenue = charge all returned boats for 
    # hours rented
    total_revenue = 0
    @returned_boats.each_key do |boat| 
      total_revenue += charge(boat)[:amount]
    end
    total_revenue
  end
end