pizza_toppings = {
  veggies: ["green peppers", "jalapeño", "mushrooms"],
  protein: ["pepperoni", "sausage", "sardines"],
  fruit: ["pineapple"]
}

# 1. what is pizza_toppings.count
3 #returns just the number of hash pairs
p pizza_toppings.count
# 2. what is pizza_toppings.values
3 #3 arrays inside of one array
p pizza_toppings.values
# 3. how can I access the element “pineapple”
p pizza_toppings[:fruit]
# 4. how can I add the element “olives” to the key “veggies”?
p pizza_toppings[:veggies].push("olives")
p pizza_toppings[:veggies] << "olives"

