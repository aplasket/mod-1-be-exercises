class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id_num)
    @artists.find do |artist|
      artist.id == id_num
    end
  end

  def photographs_by_artist
    artists_photos = {}
    
    @photographs.map do |photo|
      photo_id_num = photo.id
      artist_object = find_artist_by_id(photo_id_num)
      artists_photos[artist_object] = [photo]
    end

    artists_photos
  end
end