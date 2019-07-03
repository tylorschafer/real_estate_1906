class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(select)
    @rooms.select{|room| room.category == select}
  end

  def area
    @rooms.map{|room| room.area}.sum
  end

  def price_per_square_foot
     (@price / area.to_f).round(2)
  end

  def rooms_by_category
    category_hash = Hash[@rooms.collect {|room| [*room.category, room]}]
  end

end
