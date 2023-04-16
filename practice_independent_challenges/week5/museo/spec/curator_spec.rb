require "spec_helper"

RSpec.describe Curator do
  before(:each) do
    @curator = Curator.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@curator).to be_a(Curator)
    end

    it "starts with an empty array of photographs" do
      expect(@curator.photographs).to eq([])
    end

    it "starts with an empty array of artists" do
      expect(@curator.artists).to eq([])
    end
  end

  before(:each) do
    @photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })  
    @photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })        
  end

  describe "add photograph" do
    it "can add photographs to array" do
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)

      expect(@curator.photographs).to eq([@photo_1, @photo_2])
    end
  end

  before(:each) do
    @artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })
    @artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })                
  end

  describe "#add artists" do
    it "adds artist to artists array" do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      expect(@curator.artists).to eq([@artist_1, @artist_2])
    end
  end

  describe "#find artist by id" do
    it "finds an artist by their id" do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      expect(@curator.find_artist_by_id("1")).to eq(@artist_1)
    end
  end

  describe "#photographs by artist" do
    it "returns a hash of all artist and associated photographs" do
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      expect(@curator.photographs_by_artist).to eq({@artist_1 => [@photo_1],
                                                    @artist_2 => [@photo_2]})
    end
  end

  describe "#artists multiple photos" do
    before(:each) do
      @photo_3 = Photograph.new({
        id: "3",      
        name: "Starry Nights, Blue Skies",      
        artist_id: "2",      
        year: "1945"      
      })  
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
    end

    it "returns an array of artists who have multiple photos" do
      expect(@curator.photographs_by_artist).to eq({@artist_1 => [@photo_1],
                                                    @artist_2 => [@photo_2, @photo_3]})
      expect(@curator.artists_multiple_photos).to eq(["Ansel Adams"])

      photo_4 = Photograph.new({
        id: "4",      
        name: "Starry Nights, Blue Skies",      
        artist_id: "1",      
        year: "1925"      
      })  
      
      @curator.add_photograph(photo_4)
      expect(@curator.artists_multiple_photos).to eq(["Henri Cartier-Bresson", "Ansel Adams"])
    end
  end

  describe "#photos by country" do
  before(:each) do
    @photo_3 = Photograph.new({
      id: "3",      
      name: "Starry Nights, Blue Skies",      
      artist_id: "2",      
      year: "1945"      
    })
    @photo_4 = Photograph.new({
      id: "4",      
      name: "Starry Nights, Blue Skies",      
      artist_id: "1",      
      year: "1925"      
    })  
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    @curator.add_photograph(@photo_3)
    @curator.add_photograph(@photo_4)
  end

    it "returns an array of photographs taken by a photographer from a country" do
      expect(@curator.photos_by_country("United States")).to eq([@photo_2, @photo_3])
      expect(@curator.photos_by_country("France")).to eq([@photo_1, @photo_4])
    end
  end
end