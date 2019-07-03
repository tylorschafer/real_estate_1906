require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

def setup
  @house = House.new("400000", "123 sugar lane")
  @room_1 = Room.new(:bedroom, 10, 13)
  @room_2 = Room.new(:bedroom, 11, 15)
  @room_3 = Room.new(:living_room, 25, 15)
  @room_4 = Room.new(:basement, 30, 41)
end

def test_instance_of_house_class
  assert_instance_of House, @house
end

def test_house_returns_price
  assert_equal 400000, @house.price
end

def test_house_returns_address
  assert_equal "123 sugar lane", @house.address
end

def test_rooms_returns_empty_array
  assert_equal [], @house.rooms
end

def test_add_rooms_gets_inserted_to_rooms_array
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  assert [@room_1, @room_2], @house.rooms
end

def test_rooms_from_category
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(@room_3)
  @house.add_room(@room_4)
  assert_equal [@room_4], @house.rooms_from_category(:basement)
  assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
end

def test_total_house_area
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(@room_3)
  @house.add_room(@room_4)
  assert_equal 1900, @house.area
end

def test_price_per_square_foot
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(@room_3)
  @house.add_room(@room_4)
  assert_equal 210.53, @house.test_price_per_square_foot
end

def test_rooms_by_category
  skip
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(@room_3)
  @house.add_room(@room_4)
  assert_equal :bedroom=>[@room_1, @room_2], @house.rooms_by_category
end


end
