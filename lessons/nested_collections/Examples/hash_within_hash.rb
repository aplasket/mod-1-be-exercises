pets = {:dog => {:name => "Chance", :weight => "45 pounds"},
        :cat => {:name => "Sassy", :weight => "15 pounds"}
       }

# 1. what is pets.count
2 # because there 2 pairs
p pets.count
# 2. what is pets.keys
[:dog, :cat]
p pets.keys
# 3. what is pets.values
[{:name => "Chance", :weight => "45 pounds"}, {:name => "Sassy", :weight => "15 pounds"}]
p pets.values
# 4. how can I access the element "15 pounds"
p pets[:cat][:weight]
# 5. how can I add :age => 3 to the value of the key :dog
p pets[:dog][:age] = 3
