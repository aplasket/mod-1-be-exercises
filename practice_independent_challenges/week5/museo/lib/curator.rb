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
      artist_object = find_artist_by_id(photo.artist_id)
      if artists_photos.keys.include?(artist_object)
        artists_photos[artist_object] << photo
      else
        artists_photos[artist_object] = [photo]
      end
    end

    artists_photos
  end

  def artists_multiple_photos
    artists_array = []

    photographs_by_artist.each_key do |artist|
      if photographs_by_artist[artist].count > 1
        artists_array << artist.name
      end
    end

    artists_array
  end
end