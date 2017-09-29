require 'minitest/autorun'
require 'minitest/rg'

require_relative '../song'

# Test the song class.
class TestSong < MiniTest::Test
  def setup
    @song = Song.new('Walk', 'Pantera')
  end
end
