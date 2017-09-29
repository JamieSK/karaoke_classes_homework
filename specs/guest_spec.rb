require 'minitest/autorun'
require 'minitest/rg'

require_relative '../song'
require_relative '../guest'

# Test the guest class.
class TestGuest < MiniTest::Test
  def setup
    @guest = Guest.new('Kurt', 'Cobain')
    @song = Song.new('Walk', 'Pantera')
  end

  def test_pay_money
    @guest.pay!(10)
    assert_equal(90, @guest.money)
  end

  def test_guests_favourite
    @picky_guest = Guest.new('Dimebag', 'Darrell', @song)
    assert_equal(@picky_guest.favourite_song, @song)
  end
end
