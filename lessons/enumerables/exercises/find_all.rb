# 1. Using #each, write the code to find all the numbers divisible by 3
# 2. Once you get the method below to work using #each, refactor your code to use #find_all. 


def find_all_nums_divisible_by_3_v2
    numbers = [1,2,3,4,5,6,7,8,9]
    numbers.find_all {|number| number % 3 == 0}
end
# should return [3,6,9]

def find_all_nums_divisible_by_3_v1
    numbers = [1,2,3,4,5,6,7,8,9]
    selected = []
    
    numbers.each do |number| 
        if number % 3 == 0
            selected << number
        end
    end

    selected
end

# should return [3,6,9]

p find_all_nums_divisible_by_3_v2
p find_all_nums_divisible_by_3_v1