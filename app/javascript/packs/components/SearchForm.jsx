import React from 'react';
import PropTypes from 'prop-types';

class SearchForm extends React.Component {
    static propTypes = {
        onSubmit: PropTypes.func.isRequired
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
        let { artistName, albumTitle, songTitle } = this.state;
        if (artistName.length >= 3 || albumTitle.length >= 3 || songTitle.length >= 3 )
        this.props.onSubmit({
            artist_name: artistName,
            album_title: albumTitle,
            song_title: songTitle,
        });
    };

    render() {
        return (
            <form onSubmit={this.searchSubmit}>
                <div><input type="text"
                            placeholder="Artist"
                            name="artistName"
                            value={this.state.artistName}
                            onChange={this.inputChanged} /></div>
                <div><input type="text"
                            placeholder="Album"
                            name="albumTitle"
                            value={this.state.albumTitle}
                            onChange={this.inputChanged} /></div>
                <div><input type="text"
                            placeholder="Song"
                            name="songTitle"
                            value={this.state.songTitle}
                            onChange={this.inputChanged} /></div>
                <button>Search</button>
            </form>
        );
    }
}

export default SearchForm;
