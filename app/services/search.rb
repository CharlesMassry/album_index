class Search
  def self.where(params)
    Song.includes(:album, :artist)
        .where(

        )
  end
end