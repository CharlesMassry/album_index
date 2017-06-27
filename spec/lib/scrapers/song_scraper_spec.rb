require 'rails_helper'
require 'scrapers/song_scraper'

describe Scrapers::SongScraper do
  it 'inserts an artist, their albums, and songs into the database' do
    VCR.use_cassette('scrape_songs') do
      Scrapers::SongScraper.new('Taylor Swift').db_insert
    end
    expect(Artist.where(name: 'Taylor Swift')).to exist
    expect(Album.where(title: 'Red')).to exist
    expect(Song.where(title: 'I Knew You Were Trouble')).to exist
  end
end