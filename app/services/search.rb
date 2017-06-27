class Search
  def self.where(params)
    Song.joins(:album, :artist).includes(album: :artist)
        .where(Song.arel_table[:title].matches("%#{params[:song_title]}%"))
        .where(Album.arel_table[:title].matches("%#{params[:album_title]}%"))
        .where(Artist.arel_table[:name].matches("%#{params[:artist_name]}%"))
        .page(params[:page] || 1)
  end
end