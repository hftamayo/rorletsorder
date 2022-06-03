# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Meals.destroy_all

Meals.create!([
    {
        name: 'Cheese and Loroco', 
        description: 'Corn made pupusa with cheese', 
        price: 1.25, 
        available: true 
    }, 
    {
        name: 'Cheese and red deans', 
        description: 'Corn made pupusa with cheese and beans', 
        price: 0.65, 
        available: true 
    },
    {
        name: 'Pork, cheese and red beans', 
        description: 'Corn made pupusa with a mix of pork,cheese and red beans', 
        price: 0.85, 
        available: true 
    },     
    {
        name: 'Soda', 
        description: 'Salvadoran soda beverages', 
        price: 0.65, 
        available: true 
    }, 
    {
        name: 'Coffee', 
        description: 'High quality roasted salvadoran coffee', 
        price: 1.10, 
        available: true 
    }                     
    ])

    p "Meals created: #{Meals.count}"