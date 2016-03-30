# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


book_category = Category.where(name: 'Books').first_or_create(name: 'Books')
camera_category = Category.where(name: 'Camera & Accessories').first_or_create(name: 'Camera & Accessories')
clothing_category = Category.where(name: 'Clothing & Accessories').first_or_create(name: 'Clothing & Accessories')
computer_category = Category.where(name: 'Computer & Gaming').first_or_create(name: 'Computer & Gaming')
electronic_category = Category.where(name: 'Electronics').first_or_create(name: 'Electronics')
event_category = Category.where(name: 'Event Supplies & Furnitures').first_or_create(name: 'Event Supplies & Furnitures')
medical_category = Category.where(name: 'Medical Supplies').first_or_create(name: 'Medical Supplies')
musical_category = Category.where(name: 'Musical Instruments').first_or_create(name: 'Musical Instruments')
realestate_category = Category.where(name: 'Real Estate').first_or_create(name: 'Real Estate')
service_category = Category.where(name: 'Services').first_or_create(name: 'Services')
sport_category = Category.where(name: 'Sports, Fitness & Outdoor').first_or_create(name: 'Sports, Fitness & Outdoor')
vehicle_category = Category.where(name: 'Vehicles').first_or_create(name: 'Vehicles')

Subcategory.where(name: 'Academics', category_id: book_category.id).first_or_create(name: 'Academics', category_id: book_category.id)
Subcategory.where(name: 'Children & Teens', category_id: book_category.id).first_or_create(name: 'Children & Teens', category_id: book_category.id)
Subcategory.where(name: 'Literature & Fiction', category_id: book_category.id).first_or_create(name: 'Literature & Fiction', category_id: book_category.id)
Subcategory.where(name: 'Non Fiction', category_id: book_category.id).first_or_create(name: 'Non Fiction', category_id: book_category.id)

Subcategory.where(name: 'Camera', category_id: camera_category.id).first_or_create(name: 'Camera', category_id: camera_category.id)
Subcategory.where(name: 'Lenses', category_id: camera_category.id).first_or_create(name: 'Lenses', category_id: camera_category.id)
Subcategory.where(name: 'Camera Accessories', category_id: camera_category.id).first_or_create(name: 'Camera Accessories', category_id: camera_category.id)
Subcategory.where(name: 'Binoculars & Telescopes', category_id: camera_category.id).first_or_create(name: 'Binoculars & Telescopes', category_id: camera_category.id)

Subcategory.where(name: 'Kid\'s clothing & Fancy dress', category_id: clothing_category.id).first_or_create(name: 'Kid\'s clothing & Fancy dress', category_id: clothing_category.id)
Subcategory.where(name: 'Women\'s clothing', category_id: clothing_category.id).first_or_create(name: 'Women\'s clothing', category_id: clothing_category.id)
Subcategory.where(name: 'Men\'s clothing', category_id: clothing_category.id).first_or_create(name: 'Men\'s clothing', category_id: clothing_category.id)
Subcategory.where(name: 'All Accessories', category_id: clothing_category.id).first_or_create(name: 'All Accessories', category_id: clothing_category.id)

Subcategory.where(name: 'Desktops & Laptops', category_id: computer_category.id).first_or_create(name: 'Desktops & Laptops', category_id: computer_category.id)
Subcategory.where(name: 'Hard Disks & Pen Drives', category_id: computer_category.id).first_or_create(name: 'Hard Disks & Pen Drives', category_id: computer_category.id)
Subcategory.where(name: 'Computer Accessories', category_id: computer_category.id).first_or_create(name: 'Computer Accessories', category_id: computer_category.id)
Subcategory.where(name: 'Gaming', category_id: computer_category.id).first_or_create(name: 'Gaming', category_id: computer_category.id)

Subcategory.where(name: 'TV', category_id: electronic_category.id).first_or_create(name: 'TV', category_id: electronic_category.id)
Subcategory.where(name: 'Air Conditioners', category_id: electronic_category.id).first_or_create(name: 'Air Conditioners', category_id: electronic_category.id)
Subcategory.where(name: 'Music System', category_id: electronic_category.id).first_or_create(name: 'Music System', category_id: electronic_category.id)
Subcategory.where(name: 'Home Appliances', category_id: electronic_category.id).first_or_create(name: 'Home Appliances', category_id: electronic_category.id)

Subcategory.where(name: 'Event/Wedding Supplies', category_id: event_category.id).first_or_create(name: 'Event/Wedding Supplies', category_id: event_category.id)
Subcategory.where(name: 'Office Supplies', category_id: event_category.id).first_or_create(name: 'Office Supplies', category_id: event_category.id)
Subcategory.where(name: 'Home Furnitures', category_id: event_category.id).first_or_create(name: 'Home Furnitures', category_id: event_category.id)
Subcategory.where(name: 'Banquet Halls', category_id: event_category.id).first_or_create(name: 'Banquet Halls', category_id: event_category.id)

Subcategory.where(name: 'Crutches & Walkers', category_id: medical_category.id).first_or_create(name: 'Crutches & Walkers', category_id: medical_category.id)
Subcategory.where(name: 'Hospital Beds', category_id: medical_category.id).first_or_create(name: 'Hospital Beds', category_id: medical_category.id)
Subcategory.where(name: 'Medical Devices', category_id: medical_category.id).first_or_create(name: 'Medical Devices', category_id: medical_category.id)
Subcategory.where(name: 'Wheel Chairs', category_id: medical_category.id).first_or_create(name: 'Wheel Chairs', category_id: medical_category.id)

Subcategory.where(name: 'Guitars', category_id: musical_category.id).first_or_create(name: 'Guitars', category_id: musical_category.id)
Subcategory.where(name: 'Drums & Tabla', category_id: musical_category.id).first_or_create(name: 'Drums & Tabla', category_id: musical_category.id)
Subcategory.where(name: 'Piano & Keyboards', category_id: musical_category.id).first_or_create(name: 'Piano & Keyboards', category_id: musical_category.id)
Subcategory.where(name: 'Violin', category_id: musical_category.id).first_or_create(name: 'Violin', category_id: musical_category.id)

Subcategory.where(name: 'House', category_id: realestate_category.id).first_or_create(name: 'House', category_id: realestate_category.id)
Subcategory.where(name: 'Apartments & Flats', category_id: realestate_category.id).first_or_create(name: 'Apartments & Flats', category_id: realestate_category.id)
Subcategory.where(name: 'Office Commercial Space', category_id: realestate_category.id).first_or_create(name: 'Office Commercial Space', category_id: realestate_category.id)
Subcategory.where(name: 'PG, Hostels & Rooms', category_id: realestate_category.id).first_or_create(name: 'PG, Hostels & Rooms', category_id: realestate_category.id)

Subcategory.where(name: 'Tutorial Classes', category_id: service_category.id).first_or_create(name: 'Tutorial Classes', category_id: service_category.id)
Subcategory.where(name: 'Household Help & Repair', category_id: service_category.id).first_or_create(name: 'Household Help & Repair', category_id: service_category.id)
Subcategory.where(name: 'Drivers & Taxi', category_id: service_category.id).first_or_create(name: 'Drivers & Taxi', category_id: service_category.id)
Subcategory.where(name: 'Movers & Packers', category_id: service_category.id).first_or_create(name: 'Movers & Packers', category_id: service_category.id)

Subcategory.where(name: 'Cycles', category_id: sport_category.id).first_or_create(name: 'Cycles', category_id: sport_category.id)
Subcategory.where(name: 'Sports Equipments', category_id: sport_category.id).first_or_create(name: 'Sports Equipments', category_id: sport_category.id)
Subcategory.where(name: 'Gym Equipments', category_id: sport_category.id).first_or_create(name: 'Gym Equipments', category_id: sport_category.id)
Subcategory.where(name: 'Travel & Luggage', category_id: sport_category.id).first_or_create(name: 'Travel & Luggage', category_id: sport_category.id)

Subcategory.where(name: 'Bikes', category_id: vehicle_category.id).first_or_create(name: 'Bikes', category_id: vehicle_category.id)
Subcategory.where(name: 'Cars', category_id: vehicle_category.id).first_or_create(name: 'Cars', category_id: vehicle_category.id)
Subcategory.where(name: 'Trucks & Commercial Vehicles', category_id: vehicle_category.id).first_or_create(name: 'Trucks & Commercial Vehicles', category_id: vehicle_category.id)
Subcategory.where(name: 'Jeeps & Vans', category_id: vehicle_category.id).first_or_create(name: 'Jeeps & Vans', category_id: vehicle_category.id)
