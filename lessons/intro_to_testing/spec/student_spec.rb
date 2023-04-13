require 'rspec'
require './lib/student'


describe Student do
  describe '#initialize' do
    it 'is an instance of student' do
      student = Student.new('Penelope')

      expect(student).to be_an_instance_of(Student)
      #alternative method:
      # expect(student).to be_a(Student)
    end
    
    it 'has a name' do 
      student = Student.new('Penelope')

      expect(student.name).to eq('Penelope')
    end
    
    it 'starts with  no cookies' do
      student = Student.new('Penelope')

      expect(student.cookies).to be_empty
      #alternative method:
      # expect(student.cookies).to eq([])
    end
   
    it 'can add cookies' do
      student = Student.new('Penelope')
      
      student.add_cookie('Chocolate Chunk')
      expect(student.cookies).to eq(['Chocolate Chunk'])
     
      student.add_cookie('Snickerdoodle')

      expect(student.cookies).to eq(['Chocolate Chunk', 'Snickerdoodle'])
    end

  end
end
