require 'rails_helper'

describe 'User searching songs', type: :feature, js: true do
  before do
    artist = create(:artist)
    album = create(:album, artist: artist)
    @song = create(:song, album: album)
  end

  it 'Searches for a song' do
    visit '/'
    fill_in 'Song', with: 'i knew'
    click_on 'Search'
    expect(page).to have_text(@song.title)
  end
end
