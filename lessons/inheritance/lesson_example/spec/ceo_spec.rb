require './lib/ceo'

RSpec.describe Ceo do
  before(:each) do
    @ceo = Ceo.new(15, 20, "Ali", 37290)
  end

  describe "setup" do
    it "exists" do
      expect(@ceo).to be_a(Ceo)
    end
    it "has base_salary and bonus attributes" do
      expect(@ceo.base_salary).to eq(15)
      expect(@ceo.bonus).to eq(20)
    end
  end

  describe "Has a name, ID, and total_compensation" do
    # Write tests to prove that a Ceo instance can have a Name and ID number, like any other Employee.
    # Also, the CEO should be able to receive a total compensation. Write at least one test that proves they can access this method.
    it 'is an employee' do
      expect(@ceo.is_a? Employee).to be(true)
    end
    
    it 'has attributes' do
      expect(@ceo.name).to eq("Ali")
      expect(@ceo.id).to eq(37290)
    end
    
    it 'has benefits' do
      expect(@ceo.benefits).to eq([:sick_leave])
    end

    it 'has total comp' do
      expect(@ceo.total_compensation).to eq(35)
    end
    
    
  end

end