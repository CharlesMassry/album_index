class SearchesController < ApplicationController
  def show
    @songs = Search.where(params[:search])
  end
end