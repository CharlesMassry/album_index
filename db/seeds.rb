require 'scrapers/song_scraper'

[
    'blink-182',
    'Brand New',
    'Drake',
    'Fetty Wap',
    'Gym Class Heroes',
    'Katy Perry',
    'Kendrick Lamar',
    'Lady Gaga',
    'Taking Back Sunday',
    'Taylor Swift'
].each do |artist_name|
  Scrapers::SongScraper.new(artist_name).db_insert
end

