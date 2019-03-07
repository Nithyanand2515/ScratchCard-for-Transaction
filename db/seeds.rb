# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rule.create("period" => "daily", "limit" => 2, "min_range" => 50, "max_range" => 500, "type_user" => "Sender", "scratch_card_min" => 0, "scratch_card_max" => 10)
Rule.create("period" => "monthly", "limit" => 3, "min_range" => 500, "max_range" => 50000, "type_user" => "Sender", "scratch_card_min" => 0, "scratch_card_max" => 100)
Rule.create("period" => "yearly", "limit" => 3, "min_range" => 5000, "max_range" => 10000, "type_user" => "Sender", "scratch_card_min" => 0, "scratch_card_max" => 1000)
Rule.create("period" => "daily", "limit" => 2, "min_range" => 50, "max_range" => 500, "type_user" => "Receiver", "scratch_card_min" => 0, "scratch_card_max" => 10)
Rule.create("period" => "monthly", "limit" => 3, "min_range" => 500, "max_range" => 50000, "type_user" => "Receiver", "scratch_card_min" => 0, "scratch_card_max" => 50)
Rule.create("period" => "yearly", "limit" => 3, "min_range" => 5000, "max_range" => 10000, "type_user" => "Receiver", "scratch_card_min" => 0, "scratch_card_max" => 500)