require './lib/intern'

RSpec.describe Intern do
  before(:each) do
    @intern = Intern.new(5, "Chris", 12345)
  end

  describe "setup" do
    it "exists" do
      expect(@intern).to be_a Intern
    end

    it "has a base_salary attribute" do
      expect(@intern.base_salary).to eq(5)
    end

    it "can get coffee" do
      expect(@intern).to respond_to(:get_coffee)
      expect(@intern.get_coffee).to eq("Who got the latte?")
    end

    it "has benefits" do
      expect(@intern.benefits).to be_instance_of Array
      expect(@intern.benefits.length).to eq(2)
      expect(@intern.benefits[0]).to eq(:gets_to_get_me_coffee)
    end
  end

  describe "Ability to have name and ID, like any other Employee" do
    # Write tests to prove that an @intern can be an Employee, with name and ID.
    # The @intern should also have the ability to have the "sick_leave" benefit, 
    # and not just the one it starts with. 
    it 'is an employee' do
      expect(@intern.is_a? Employee).to be(true)
    end

    it 'has attributes' do
      expect(@intern.name).to eq("Chris")
      expect(@intern.id).to eq(12345)
    end

    it 'has total compensation' do
      expect(@intern.total_compensation).to eq(5)
    end

    it 'has benefits' do
      expect(@intern.benefits).to eq([:sick_leave, :gets_to_get_me_coffee])
    end
  end

end