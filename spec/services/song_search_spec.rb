require 'rails_helper'

describe SongSearch do
  before do
    @lady_gaga = create(:artist, name: 'Lady Gaga')
    @fetty_wap = create(:artist, name: 'Fetty Wap')
    @taking_back_sunday = create(:artist, name: 'Taking Back Sunday')
    @taylor_swift = create(:artist, name: 'Taylor Swift')

    @tell_all_your_friends = create(:album, title: 'Tell All Your Friends', artist: @taking_back_sunday)
    @where_you_want_to_be = create(:album, title: 'Where You Want To Be', artist: @taking_back_sunday)
    @louder_now = create(:album, title: 'Louder Now', artist: @taking_back_sunday)
    @speak_now = create(:album, title: 'Speak Now', artist: @taylor_swift)
    @trap_queen = create(:album, title: 'Trap Queen', artist: @fetty_wap)
    @the_fame_monster = create(:album, title: 'The Fame Monster', artist: @lady_gaga)

    @story_of_us = create(:song, title: 'The Story of Us', album: @speak_now)
    @my_blue_heaven = create(:song, title: 'My Blue Heaven', album: @louder_now)
    @your_so_last_summer = create(:song, title: "You're So Last Summer", album: @tell_all_your_friends)
    @one_eighty_by_summer = create(:song, title: 'One Eighty By Summer', album: @where_you_want_to_be)
    @she_badd = create(:song, title: 'She Badd', album: @trap_queen)
    @bad_girlz = create(:song, title: 'Bad Girlz', album: @trap_queen)
    @bad_romance = create(:song, title: 'Bad Romance', album: @the_fame_monster)
  end

  it 'searches through the song' do
    search_results = SongSearch.where({ song_title: 'bad'})
    expect(search_results.length).to eq(3)
  end

  it 'searches through the artist' do
    search_results = SongSearch.where({ artist_name: 'lady'})
    expect(search_results.length).to eq(1)
    expect(search_results.first.id).to eq(@bad_romance.id)
  end

  it 'searches through the album' do
    search_results = SongSearch.where({ album_title: 'trap'})
    expect(search_results.length).to eq(2)
    expect(search_results.first.album_id).to eq(@trap_queen.id)
  end

  it 'searches through the artist and the song' do
    search_results = SongSearch.where({ artist_name: 'taking', song_title: 'summer'})
    expect(search_results.length).to eq(2)
    expect(search_results.first.id).to eq(@one_eighty_by_summer.id) | eq(@your_so_last_summer.id)
  end

  it 'searches through the artist and the album' do
    search_results = SongSearch.where({ artist_name: 'taking', album_title: 'now'})
    expect(search_results.length).to eq(1)
    expect(search_results.first.id).to eq(@my_blue_heaven.id)
  end

  it 'searches through the song and the album' do
    search_results = SongSearch.where({ song_title: 'summer', album_title: 'where you'})
    expect(search_results.length).to eq(1)
    expect(search_results.first.id).to eq(@one_eighty_by_summer.id)
  end

  it 'searches through the artist, album, and song' do
    search_results = SongSearch.where({ song_title: 'us', album_title: 'now', artist_name: 'taylor'})
    expect(search_results.length).to eq(1)
    expect(search_results.first.id).to eq(@story_of_us.id)
  end
end
