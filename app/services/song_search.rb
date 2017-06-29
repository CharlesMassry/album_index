class SongSearch
  def self.where(params)
    query = Song.joins(:album, :artist).includes(album: :artist)

    if param_present?(params[:artist_name])
      query = query.where(Artist.arel_table[:name].matches("%#{params[:artist_name]}%"))
    end

    if param_present?(params[:album_title])
      query = query.where(Album.arel_table[:title].matches("%#{params[:album_title]}%"))
    end

    if param_present?(params[:song_title])
      query = query.where(Song.arel_table[:title].matches("%#{params[:song_title]}%"))
    end

    query.order('LOWER(artists.name)')
        .page(params[:page] || 1)
  end

  def self.param_present?(param)
    param.present? && param.length >= 3
  end
end