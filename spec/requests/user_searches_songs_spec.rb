require 'rails_helper'

describe 'User searching songs', type: :feature, js: true do
  before do
    @artist = create(:artist)
    @album = create(:album, artist: @artist)
    @song = create(:song, album: @album)
  end

  it 'displays songs when a user searches for a song' do
    visit '/'
    fill_in 'songTitle_input', with: 'i knew'
    click_on 'Search'
    expect(page).to have_text(@song.title)
    expect(page).to have_text("#{@song.duration / 60}:#{@song.duration % 60}")
    expect(page).to have_text(@album.title)
    expect(page).to have_text(@artist.name)
  end

  it 'allows the user to paginate search results' do
    30.times do |time|
      create(:song, album: @album, title: "#{@song.title}_#{time}")
    end

    visit '/'
    fill_in 'songTitle_input', with: 'i knew'
    click_on 'Search'
    expect(page).to have_selector('.song-list-item', count: 25)

    page.execute_script 'var songListContainer = document.getElementById("songListContainer");' +
                        'songListContainer.scrollTop = songListContainer.scrollHeight;'

    expect(page).to have_selector('.song-list-item', count: 31)
  end

  # TODO: figure out why finding elements doesn't work on elements that have their class list changed by Javascript
  it 'is mobile responsive' do
    visit '/'
    resize_window(width: 375, height: 559)
    expect(page.execute_script('return document.getElementById("songListContainer").classList')).to include('hidden')
    fill_in 'songTitle_input', with: 'i knew'
    click_on 'Search'

    expect(page).to have_selector('.song-list-item')
    expect(page.execute_script('return document.getElementById("searchForm").classList')).to include('hidden')
    expect(page.execute_script('return document.getElementById("songListContainer").classList')).not_to include('hidden')
  end
end
