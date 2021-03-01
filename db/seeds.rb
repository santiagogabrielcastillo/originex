puts "Deleting previous data..."
Activity.destroy_all


puts "Creating activities..."
Activity.create!(
  title: "Go for a run",
  category: "Outdoor sports",
  description: "Enjoy the nature while running among friends!",
  address: "Infanta Isabel 410, Buenos Aires, Argentina"
)
Activity.create!(
  title: "Go to the Art's museum",
  category: "Cultural activities",
  description: "Discover the Museo de Arte Latinoamericano de Buenos Aires (MALBA)",
  address: "Figueroa Alcorta 3415, Buenos Aires, Argentina"
)
Activity.create!(
  title: "Eat a pizza",
  category: "Food and drinks",
  description: "Have a pizza in an iconic place of Buenos Aires, Pizzería Guerrín",
  address: "Av. Corrientes 1368, Buenos Aires, Argentina"
)

puts "Seeds created"