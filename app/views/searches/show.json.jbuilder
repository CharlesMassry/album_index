json.cache! @songs do
  json.total_count @songs.total_count

  json.songs @songs do |song|
    json.partial! song

    json.album do
      json.partial! song.album
    end

    json.artist do
      json.partial! song.album.artist
    end
  end
end
