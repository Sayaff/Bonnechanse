# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CartStatus.delete_all
CartStatus.create! id: 1, name: "In Progress"
CartStatus.create! id: 2, name: "Placed"
CartStatus.create! id: 3, name: "Delivered"
CartStatus.create! id: 4, name: "Cancelled"
