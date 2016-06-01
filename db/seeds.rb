# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create :first_name => "super", :last_name => "user", :password => "BxFKnL/AvtWjwT7lQm4tZA==\n", :email => "supe@user.com", :uuid => "20160424173145asdzx@", :contact_number1 => "9876543210", :is_first_logged_in => true, :is_super_user => true, :user_last_location => "kolkata", :status => "Active", :created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
User.create :first_name => "admin", :last_name => "user", :password => "BxFKnL/AvtWjwT7lQm4tZA==\n", :email => "admin@user.com", :uuid => "20160424173123asdzx@", :contact_number1 => "9876543310", :is_first_logged_in => true, :is_super_user => true, :user_last_location => "Burla", :status => "Active", :created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
User.create :first_name => "app", :last_name => "user", :password => "BxFKnL/AvtWjwT7lQm4tZA==\n", :email => "app@user.com", :uuid => "20160424973145asdzx@", :contact_number1 => "9816543210", :is_first_logged_in => true, :is_super_user => true, :user_last_location => "Sambalpur", :status => "Active", :created_at => DateTime.now.utc, :updated_at => DateTime.now.utc

Location.delete_all
Location.create :location => "Kolkata"
Location.create :location => "Burla"
Location.create :location => "Sambalpur"

Gym.delete_all
Gym.create :name => "Raju Gym", :user_id => 2, :uuid => "201603301906585d52ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 1,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
Gym.create :name => "Shyamu Gym", :user_id => 2, :uuid => "201603301906581d52ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 2,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
Gym.create :name => "Kanu Gym", :user_id => 2, :uuid => "201653301906581d52ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 3,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc

Spa.delete_all
Spa.create :name => "Raju Spa", :user_id => 2, :uuid => "201619301906585d52ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 1,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
Spa.create :name => "Shyamu Spa", :user_id => "2", :uuid => "201703301906585d52ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 2,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
Spa.create :name => "Kanu Spa", :user_id => "2", :uuid => "201803301906585d52ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 3,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc

SportCentre.delete_all
SportCentre.create :name => "Raju SportCentre", :user_id => "2", :uuid => "201613301906585d54ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 1,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
SportCentre.create :name => "Raju SportCentre", :user_id => "2", :uuid => "201613301906585d55ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 2,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
SportCentre.create :name => "Raju SportCentre", :user_id => "2", :uuid => "201613301906585d56ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 3,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc

Salon.delete_all
Salon.create :name => "Raju Salon", :user_id => "2", :uuid => "201614301906585d56ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 1,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
Salon.create :name => "Raju Salon", :user_id => "2", :uuid => "201615301906585d56ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 2,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc
Salon.create :name => "Raju Salon", :user_id => "2", :uuid => "201616301906585d56ea", :caption => "brand new items", :address => "sector-5, kolkata", :status => "Active", :location_id => 3,:created_at => DateTime.now.utc, :updated_at => DateTime.now.utc

ServiceType.delete_all
ServiceType.create :name => "Gym"
ServiceType.create :name => "Spa"
ServiceType.create :name => "SportCentre"
ServiceType.create :name => "Salon"

Service.delete_all
Service.create :uuid => "12345678900987654322", :shop_uuid => "201603301906585d52ea", :service_type => ServiceType.find_by_name("Gym").id, :name => "xyz", :cost => 300
Service.create :uuid => "12345678900987654323",:shop_uuid => "201619301906585d52ea", :service_type => ServiceType.find_by_name("Spa").id, :name => "lmn", :cost => 300
Service.create :uuid => "12345678900987654324",:shop_uuid => "201613301906585d54ea", :service_type => ServiceType.find_by_name("SportCentre").id, :name => "ooo", :cost => 300
Service.create :uuid => "12345678900987654325",:shop_uuid => "201614301906585d56ea", :service_type => ServiceType.find_by_name("Salon").id, :name => "wwe", :cost => 300

Booking.delete_all
Booking.create :uuid => "12345678900987654321", :user_uuid => "20160424973145asdzx@", :service_uuid => "12345678900987654322", :time_slots => "[5,6]", :booking_token => "cnnnvrdnvrjdwadnnvznjvrnnvrjnzvnnrz", :cost => 300, :date => DateTime.now.utc+5.days
Booking.create :uuid => "12345678901987654321", :user_uuid => "20160424973145asdzx@", :service_uuid => "12345678900987654323", :time_slots => "[6,7]", :booking_token => "cnnnvrdnvrjnjnnvnnvznjvdwadwjnzvnnrz", :cost => 300, :date => DateTime.now.utc+6.days
Booking.create :uuid => "12345678902987654321", :user_uuid => "20160424973145asdzx@", :service_uuid => "12345678900987654324", :time_slots => "[8]", :booking_token => "cnnnvrdnvrjnjnnvnnvznjvrnndwadzvnnrz", :cost => 300, :date => DateTime.now.utc+7.days
Booking.create :uuid => "12345678903987654321", :user_uuid => "20160424973145asdzx@", :service_uuid => "12345678900987654325", :time_slots => "[9,10]", :booking_token => "cnnnvrdnvrjnjnnvnnvznjdwadwnvrjnzvnnrz", :cost => 300, :date => DateTime.now.utc+8.days

TimeSlot.delete_all
TimeSlot.create :time_frame => "0-1"
TimeSlot.create :time_frame => "1-2"
TimeSlot.create :time_frame => "2-3"
TimeSlot.create :time_frame => "3-4"
TimeSlot.create :time_frame => "4-5"
TimeSlot.create :time_frame => "5-6"
TimeSlot.create :time_frame => "6-7"
TimeSlot.create :time_frame => "7-8"
TimeSlot.create :time_frame => "8-9"
TimeSlot.create :time_frame => "9-10"
TimeSlot.create :time_frame => "10-11"
TimeSlot.create :time_frame => "11-12"
TimeSlot.create :time_frame => "12-13"
TimeSlot.create :time_frame => "13-14"
TimeSlot.create :time_frame => "14-15"
TimeSlot.create :time_frame => "15-16"
TimeSlot.create :time_frame => "16-17"
TimeSlot.create :time_frame => "17-18"
TimeSlot.create :time_frame => "18-19"
TimeSlot.create :time_frame => "19-20"
TimeSlot.create :time_frame => "20-21"
TimeSlot.create :time_frame => "21-22"
TimeSlot.create :time_frame => "22-23"
TimeSlot.create :time_frame => "23-24"

DaySlot.delete_all
DaySlot.create :day => "Sunday"
DaySlot.create :day => "Monday"
DaySlot.create :day => "Tuesday"
DaySlot.create :day => "Wednesday"
DaySlot.create :day => "Thursday"
DaySlot.create :day => "Friday"
DaySlot.create :day => "Saturday"





