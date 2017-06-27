import React from 'react';
import axios from 'axios';

import SearchForm from './SearchForm';
import SongListItem from './SongListItem';

class App extends React.Component {
    componentWillMount() {
        this.state = {
            songs: []
        };
    }

    searchSubmit = (params) => {
        axios.get('/search.json', params).then((response) => {
           this.setState({ songs: response.data });
        });
    };

    render() {
        return (
            <div>
                <SearchForm onSubmit={this.searchSubmit}/>
                <ul>
                    { this.state.songs.map( song => <SongListItem key={song.id} song={song}/> )}
                </ul>
            </div>
        );
    }
}

export default App;
