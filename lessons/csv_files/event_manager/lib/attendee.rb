class Attendee
  attr_reader :id,
              :name,
              :zipcode

  def initialize(id, first_name, last_name, zipcode)
    @id = id
    @name = "#{first_name} #{last_name}"
    @zipcode = zipcode.to_s.rjust(5,"0")[0..4]
  end

  def display
    "#{id}: #{name}, #{zipcode.to_i}"
  end

  def clean_zip
    @zipcode.to_s.rjust(5,"0")[0..4]
  end
end