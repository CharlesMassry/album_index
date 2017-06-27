json.cache! @songs do
  json.array! @songs do |song|
    json.partial! song

    json.album do
      json.partial! song.album
    end

    json.artist do
      json.partial! song.album.artist
    end
  end
end
