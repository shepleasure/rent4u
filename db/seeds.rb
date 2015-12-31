# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

baby_category = Category.where(name: 'Baby Accessories and Toys').first_or_create(name: 'Baby Accessories and Toys')
book_category = Category.where(name: 'Books').first_or_create(name: 'Books')
camera_category = Category.where(name: 'Camera and Accessories').first_or_create(name: 'Camera and Accessories')
costume_category = Category.where(name: 'Costume and Accessories').first_or_create(name: 'Costume and Accessories')
electronic_category = Category.where(name: 'Electronics').first_or_create(name: 'Electronics')
event_category = Category.where(name: 'Event and Wedding Supplies').first_or_create(name: 'Event and Wedding Supplies')
media_category = Category.where(name: 'Media and Gaming').first_or_create(name: 'Media and Gaming')
medical_category = Category.where(name: 'Medical Supplies').first_or_create(name: 'Medical Supplies')
musical_category = Category.where(name: 'Musical Instruments').first_or_create(name: 'Musical Instruments')
realestate_category = Category.where(name: 'Real Estate').first_or_create(name: 'Real Estate')
sevice_category = Category.where(name: 'Services').first_or_create(name: 'Services')
sport_category = Category.where(name: 'Sports, Fitness and Outdoor').first_or_create(name: 'Sports, Fitness and Outdoor')
vehicle_category = Category.where(name: 'Vehicles').first_or_create(name: 'Vehicles')

Subcategory.where(name: 'Toys', category_id: baby_category.id).first_or_create(name: 'Toys', category_id: baby_category.id)
Subcategory.where(name: 'Competitive Exams', category_id: book_category.id).first_or_create(name: 'Competitive Exams', category_id: book_category.id)
Subcategory.where(name: 'Camera', category_id: camera_category.id).first_or_create(name: 'Camera', category_id: camera_category.id)
Vehicles

