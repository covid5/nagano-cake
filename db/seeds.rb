# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(id: 1, email: "aaa@aaa.com", password: "aaaaaa")
#修正
Admin.create!(email: 'test@mail', password: '123456')

20.times do |i|
	Member.create!(
		first_name:"#{i}",
		last_name:"#{i}",
		first_name_kana: "#{i}",
		last_name_kana: "#{i}",
		post_code: "#{i}#{i}#{i}#{i}#{i}#{i}#{i}",
		phone_number: "#{i}#{i}#{i}#{i}#{i}#{i}#{i}",
		address: "#{i}",
		email: "#{i}@#{i}",
		password: "#{i}#{i}#{i}#{i}#{i}#{i}"
		)


end
