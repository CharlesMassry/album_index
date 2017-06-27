import React from 'react';
import axios from 'axios';

import SearchForm from './SearchForm';
import SongListItem from './SongListItem';
import loadingIcon from '../loading.svg';

class App extends React.Component {
    componentWillMount() {
        this.state = {
            songs: [],
            totalCount: 0,
            page: 1,
            isLoading: false,
            searchParams: {
                artist_name: '',
                album_title: '',
                song_title: ''
            }
        };

        document.addEventListener('scroll', this.handleScroll);
    }

    searchSubmit = (params) => {
        let newState = Object.assign({}, { isLoading: true, page: 1, songs: [] }, { searchParams: params });
        this.setState(newState);
        getSearchResults(params, this.state.page).then( response => this.addSongs(response) );
    };

    addSongs(response) {
        this.setState({
            songs: this.state.songs.concat(response.data.songs),
            isLoading: false,
            page: this.state.page + 1,
            totalCount: response.data.total_count
        });
    }

    handleScroll = () => {
        const scrollFromBottomPosition = 500;
        const shouldLoadMore = getDocumentHeight() - (window.scrollY + window.innerHeight) < scrollFromBottomPosition;
        if (shouldLoadMore && !this.state.isLoading && this.state.songs.length !== this.state.totalCount) {
            this.setState({ isLoading: true });
            getSearchResults(this.state.searchParams, this.state.page).then( response => this.addSongs(response) );
        }
    };

    render() {
        return (
            <div>
                <SearchForm onSubmit={this.searchSubmit}/>
                <ul>
                    { this.state.songs.map( song => <SongListItem key={song.id} song={song}/> )}
                </ul>
                { this.state.isLoading && <img src={loadingIcon} width="64" height="64" /> }
            </div>
        );
    }
}

function getDocumentHeight() {
    return Math.max(
        document.body.scrollHeight, document.documentElement.scrollHeight,
        document.body.offsetHeight, document.documentElement.offsetHeight,
        document.body.clientHeight, document.documentElement.clientHeight
    );
}

function getSearchResults(params, page) {
    return axios.get('/search.json',
        {
            params: {
                artist_name: params.artist_name,
                album_title: params.album_title,
                song_title: params.song_title,
                page
            }
        }
    )
}

export default App;
