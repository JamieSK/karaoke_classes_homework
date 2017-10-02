# Guest class for a karaoke venue
class Guest
  attr_reader :money, :favourite_song, :insobriety

  def initialize(forename, surname, favourite_song = nil)
    @forename = forename
    @surname = surname
    @money = 100
    @favourite_song = favourite_song
    @insobriety = 0
  end

  def pay!(amount)
    @money -= amount
    amount
  end

  def checkin_response(songs)
    return 'Whoo!' if songs.include?(@favourite_song)
    nil
  end

  def drink!(drink_effect)
    @insobriety += drink_effect
  end
end
