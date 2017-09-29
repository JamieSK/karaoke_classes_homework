require 'minitest/autorun'
require 'minitest/rg'

require_relative '../song'
require_relative '../room'
require_relative '../guest'

# Test the room class.
class TestRoom < MiniTest::Test
  def setup
    @room = Room.new('Blue Room', 3)
    @guest = Guest.new('Kurt', 'Cobain')
    @guest2 = Guest.new('Dave', 'Grohl')
    @guest3 = Guest.new('Krist', 'Novoselic')
    @guest4 = Guest.new('Justin', 'Bieber')
    @song = Song.new('Walk', 'Pantera')
  end

  def test_add_song_to_room
    @room.add_song(@song)
    assert(@room.songs.include?(@song))
  end

  def test_add_guest_to_room
    @room.add_guest(@guest)
    assert(@room.guests.include?(@guest))
  end

  def test_guest_pays_for_room
    @room.add_guest(@guest)
    assert_equal(90, @guest.money)
  end

  def test_remove_guest_from_room
    @room.add_guest(@guest)
    assert(@room.guests.include?(@guest))
    @room.remove_guest(@guest)
    refute(@room.guests.include?(@guest))
  end

  def test_too_many_guests
    @room.add_guest(@guest)
    @room.add_guest(@guest2)
    @room.add_guest(@guest3)
    assert_raises(RoomOverflowError) {@room.add_guest(@guest4)}
  end

  def test_whoo_at_favourite
    @picky_guest = Guest.new('Dimebag', 'Darrell', @song)
    @room.add_song(@song)
    assert_equal('Whoo!', @room.add_guest(@picky_guest))
  end

  def test_no_whoo
    @picky_guest = Guest.new('Dimebag', 'Darrell', @song)
    assert_nil(@room.add_guest(@picky_guest))
  end

  def test_entry_spend_total
    @room.add_guest(@guest)
    assert_equal(10, @room.entry_spend)
    @room.add_guest(@guest2)
    assert_equal(20, @room.entry_spend)
    @room.add_guest(@guest3)
    assert_equal(30, @room.entry_spend)
  end

  def test_sell_drink
    @room.sell_drink(@guest, :lager)
    assert_equal(98, @guest.money)
    assert_equal(1, @guest.insobriety)
  end
end
