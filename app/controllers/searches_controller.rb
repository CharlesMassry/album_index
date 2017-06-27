class SearchesController < ApplicationController
  def show
    @songs = Search.where(params)
  end
end