import React from 'react';
import PropTypes from 'prop-types';

import SearchInput from './SearchInput';

class SearchForm extends React.Component {
    static propTypes = {
        onSubmit: PropTypes.func.isRequired,
        isHidden: PropTypes.bool
    };

    componentWillMount() {
        this.state = {
            artistName: '',
            albumTitle: '',
            songTitle: ''
        };
    }

    inputChanged = (event) => {
        this.setState({ [event.currentTarget.name]: event.currentTarget.value })
    };

    searchSubmit = (event) => {
        event.preventDefault();
        const { artistName, albumTitle, songTitle } = this.state;
        if (artistName.length >= 3 || albumTitle.length >= 3 || songTitle.length >= 3)
        this.props.onSubmit({
            artist_name: artistName,
            album_title: albumTitle,
            song_title: songTitle,
        });
    };

    render() {
        return (
            <form className={`search-form ${this.props.isHidden ? 'hidden' : ''}`} id="searchForm" onSubmit={this.searchSubmit}>
                <SearchInput placeholder="Artist"
                             name="artistName"
                             value={this.state.artistName}
                             onChange={this.inputChanged} />
                <SearchInput placeholder="Album"
                             name="albumTitle"
                             value={this.state.albumTitle}
                             onChange={this.inputChanged} />
                <SearchInput placeholder="Song"
                             name="songTitle"
                             value={this.state.songTitle}
                             onChange={this.inputChanged} />
                <button className="search-button">Search</button>
            </form>
        );
    }
}

export default SearchForm;
