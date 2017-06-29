require 'rails_helper'

describe SearchesController do
  describe 'show' do
    render_views
    before do
      @artist = create(:artist)
      @album = create(:album, artist: @artist)
      @song = create(:song, album: @album)
    end

    it 'should render search' do
      get :show, params: { song_title: @song.title[0..4] }, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response['songs'][0]['title']).to eq(@song.title)
    end

    it 'does not search if there are no params given' do
      get :show, format: :json
      json_response = JSON.parse(response.body)
      expect(json_response).to be_empty
    end
  end
end