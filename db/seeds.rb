require 'faker'

# cards
flags = ["Mastercard", "Visa", "American Express", "Hipercard"]

6.times do
  Card.create!(
    description: Faker::Bank.name[0..19], 
    flag: flags.sample, 
    limit: Faker::Number.between(from: 200, to: 10000), 
    closure: "25",
    expiration: "05"
  )
end