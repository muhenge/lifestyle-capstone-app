# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)
# @message.image.attach(io: File.open('/path/to/file'), filename: 'file.pdf')

tech = Category.create(name:'Technology',priority:1)
tech.image.attach(io: File.open("#{Rails.root}/app/assets/images/technology.jpg"), filename: "technology.jpg")
science = Category.create(name:'Sciences',priority: 2)
science.image.attach(io: File.open("#{Rails.root}/app/assets/images/science.jpg"), filename: "science.jpg")
art = Category.create(name:'Art',priority: 3)
art.image.attach(io: File.open("#{Rails.root}/app/assets/images/art2.jpeg"), filename: "art2.jpeg")
sport = Category.create(name:'Sport',priority: 4)
sport = sport.image.attach(io: File.open("#{Rails.root}/app/assets/images/sport.png"), filename: "sport.png")
ent = Entertainments = Category.create(name:'Entertainments',priority: 5)
ent.image.attach(io: File.open("#{Rails.root}/app/assets/images/entertainment.jpeg"), filename: "entertainment.jpeg")
music = Category.create(name:'Music',priority: 6)
music.image.attach(io: File.open("#{Rails.root}/app/assets/images/music.jpg"), filename: "music.jpg")
