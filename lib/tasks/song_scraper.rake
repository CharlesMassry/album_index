require 'scrapers/song_scraper'

namespace :scrapers do
  desc 'Scrapes the artist, albums, and song from the last fm api'
  task :song_scraper, [:artist_name] => :environment do |t, args|
    Scrapers::SongScraper.new(args[:artist_name]).db_insert
  end
end
