
	Category.destroy_all
	name_list = ["tradamerican","steak","burgers","bbq","italian","japanese","cafes","korean"]

	name_list.each do |n|
		Category.create(:name=>n)
    puts"Category created"
	end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
