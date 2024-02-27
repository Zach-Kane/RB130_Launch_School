
class BeerSong
  def self.verse(verse)
    case verse
    when 3..99
      bottle1 = 'bottles'
      bottle2 = 'bottles'
    when 2
      bottle1 = 'bottles'
      bottle2 = 'bottle'
    end
    song1 = <<~SONG
    #{verse} #{bottle1} of beer on the wall, #{verse} #{bottle1} of beer.
    Take one down and pass it around, #{verse - 1} #{bottle2} of beer on the wall.
    SONG
    song2 = <<~SONG
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    SONG
    song3 = <<~SONG
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    SONG
    case verse
    when 2..99
        return song1
    when 1
      return song2
    when 0
      return song3
    end
  end

  def self.verses(v1, v2)
    song = []
    (v2..v1).each do |verse|
      song << BeerSong.verse(verse)
    end
    song.reverse.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end
end
