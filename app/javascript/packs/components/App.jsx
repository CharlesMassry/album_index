import React from 'react';
import axios from 'axios';

import SearchForm from './SearchForm';
import SongListItem from './SongListItem';
import Header from './Header';
import loadingIcon from '../images/loading.svg';

const initialState = {
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

class App extends React.Component {
    componentWillMount() {
        this.state = {
           ...initialState,
            isMobile: false
        };
    }

    componentDidMount() {
        window.addEventListener('resize', this.handleResize);
        this.songListContainer.addEventListener('scroll', this.handleScroll);
        this.handleResize();
    }

    componentWillUnmount() {
        window.removeEventListener('resize', this.handleResize);
        this.songListContainer.removeEventListener('scroll', this.handleScroll);
    }

    searchSubmit = (params) => {
        this.setState({
            isLoading: true,
            page: 1,
            songs: [],
            searchParams: params
        });
        getSearchResults(params, 1).then( response => this.addSongs(response) );
    };

    addSongs(response) {
        this.setState({
            songs: this.state.songs.concat(response.data.songs),
            isLoading: false,
            page: this.state.page + 1,
            totalCount: response.data.total_count
        });
    }

    handleResize = () => {
        if (!this.resizeTimeout) {
            this.resizeTimeout = setTimeout(() => {
                this.resizeTimeout = null;
                const mobileWidthThreshold = 640;
                const isMobile = window.innerWidth < mobileWidthThreshold;
                if (isMobile !== this.state.isMobile) {
                    this.setState({ isMobile });
                }
            }, 66);
        }
    };

    handleScroll = () => {
        const scrollFromBottomPosition = 0;
        const scrollShouldLoadMore = this.songListContainer.scrollTop + this.songListContainer.offsetHeight - this.songListContainer.scrollHeight === scrollFromBottomPosition;
        const notLoading = !this.state.isLoading;
        const moreToLoad = this.state.songs.length !== this.state.totalCount;
        if (scrollShouldLoadMore && notLoading && moreToLoad) {
            this.setState({ isLoading: true });
            getSearchResults(this.state.searchParams, this.state.page).then( response => this.addSongs(response) );
        }
    };

    backButtonClicked = () => {
        this.setState(initialState)
    };

    setSongListContainer = (ref) => {
        this.songListContainer = ref;
    };

    render() {
        return (
            <div>
                <Header onBackButtonClick={this.backButtonClicked}
                        showBackButton={this.state.songs.length > 0 && this.state.isMobile}
                />
                <SearchForm isHidden={!shouldDisplayForm(this.state)}
                            onSubmit={this.searchSubmit}/>
                <div ref={this.setSongListContainer}
                     id="songListContainer"
                     className={`song-list-container ${!shouldDisplaySongs(this.state) ? 'hidden' : ''}`}>
                    <ul className="song-list">
                        { this.state.songs.map( song => <SongListItem key={song.id} song={song}/> )}
                    </ul>
                     { this.state.isLoading && <img className={this.state.songs.length > 0 ? 'loading-more' : 'loading'} src={loadingIcon} width="64" height="64" /> }
                </div>
            </div>
        );
    }
}

function shouldDisplayForm(state) {
    return (state.songs.length === 0 && !state.isLoading) || !state.isMobile;
}

function shouldDisplaySongs(state) {
    return state.songs.length > 0 || state.isLoading || !state.isMobile;
}

function getSearchResults(params, page) {
    return axios.get('/search.json',
        {
            params: {
                ...params,
                page
            }
        }
    )
}

export default App;
