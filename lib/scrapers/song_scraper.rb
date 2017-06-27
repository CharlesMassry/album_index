require 'httparty'
module Scrapers
  class SongScraper
    include HTTParty
    API_KEY = ENV['LAST_FM_API_KEY']
    base_uri 'http://ws.audioscrobbler.com/2.0/'
    query_string_normalizer proc { |query|
      query.map do |key, value|
        "#{key}=#{value}"
      end.join('&')
    }

    def initialize(artist_name)
      @artist_name = artist_name
    end

    def db_insert
      artist = Artist.create(name: @artist_name)
      top_albums = self.class.get('', {
          query: {
              method: 'artist.getTopAlbums',
              artist: @artist_name.gsub(/\s/, '+'),
              api_key: API_KEY,
              format: 'json'
          }
      }).parsed_response['topalbums']['album']

      top_albums.first(5).each do |album_response|
        album = Album.create({
                                 title: album_response['name'],
                                 album_art_url: album_response['image'].find { |image| image['size'] === 'medium' }['#text'],
                                 artist: artist
                             })
        sleep 1
        songs_response = self.class.get('', {
            query: {
                method: 'album.getInfo',
                artist: @artist_name.gsub(/\s/, '+'),
                album: album.title.gsub(/\s/, '+'),
                api_key: API_KEY,
                format: 'json'
            }
        }).parsed_response['album']['tracks']['track']

        songs_response.each do |song_response|
          Song.create(
              title: song_response['name'],
              duration: song_response['duration'].to_i,
              album: album
          )
        end
      end
    end
  end
end
