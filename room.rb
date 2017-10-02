# Room class for a karaoke venue
class Room
  attr_reader :guests, :songs, :entry_spend
  def initialize(name, spaces)
    @name = name
    @songs = []
    @guests = []
    @spaces = spaces
    @entry_fee = 10
    @entry_spend = 0
    @drinks_spend = 0
    @drinks_menu = {
      lager: {
        cost: 2,
        effect: 1
      },
      wine: {
        cost: 4,
        effect: 3
      },
      cocktail: {
        cost: 10,
        effect: 4
      }
    }
  end

  def add_song(song)
    @songs << song
  end

  def add_guest(guest)
    raise RoomOverflowError if @guests.length >= @spaces
    raise RoomOverflowError if guest.money < @entry_fee

    @entry_spend += guest.pay!(@entry_fee)
    @guests << guest
    guest.checkin_response(@songs)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def sell_drink(guest, drink_name)
    if @drinks_menu[drink_name][:cost] <= guest.money
      guest.pay!(@drinks_menu[drink_name][:cost])
      guest.drink!(@drinks_menu[drink_name][:effect])
    end
  end
end

class RoomOverflowError < StandardError
end
