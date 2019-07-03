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


end
