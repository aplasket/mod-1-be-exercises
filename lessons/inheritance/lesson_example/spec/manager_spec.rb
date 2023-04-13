require "./lib/manager"

RSpec.describe Manager do
  before(:each) do
    @manager = Manager.new(12, "Ben", 34275)
  end
  describe "setup" do
    it "exists" do
      expect(@manager).to be_a Manager
    end

    it "has base_salary, per_team_rate, and departments attributes" do
      expect(@manager.base_salary).to eq(12)
      expect(@manager.per_team_rate).to eq 5
      expect(@manager.departments).to be_instance_of Array
      expect(@manager.departments.length).to eq (0)
    end

    it "can add_department" do
      @manager.add_department("Sales")
      expect(@manager.departments).to eq(["Sales"])
      expect(@manager.departments.length).to eq(1)
    end

    it "has benefits to start with" do
      expect(@manager.benefits[0]).to eq(:health_insurance)
    end
  end

  describe "Ability to have name and ID, like any other Employee" do
    # Write tests to prove that a Manager instance can have a Name and ID number, like any other Employee.
    # Also, a Manager should be able to receive a total compensation. Write at least one test that proves they can access this method.
    it 'is an employee' do
      expect(@manager.is_a? Employee).to be(true)
    end
    
    it 'has attributes' do
      expect(@manager.name).to eq("Ben")
      expect(@manager.id).to eq(34275)
    end
    
    it 'has benefits' do
      expect(@manager.benefits).to eq([:health_insurance, :sick_leave])
    end

    it 'has total comp' do
      expect(@manager.total_compensation).to eq(72)
    end
  end
end