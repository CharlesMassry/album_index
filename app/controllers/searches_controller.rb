class SearchesController < ApplicationController
  def show
    render json: [] and return unless param_is_present?(:song_title) ||
        param_is_present?(:album_title) ||
        param_is_present?(:artist_title)
    @songs = SongSearch.where(params)
  end

  private
  def param_is_present?(param)
    params[param] && params[param].length > 2
  end
end