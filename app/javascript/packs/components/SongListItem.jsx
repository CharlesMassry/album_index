import React from 'react';
import PropTypes from 'prop-types';

function SongListItem(props) {
    return (
        <li className="song-list-item">
            <div className="song-left">
                <img className="song-album-art"
                     width="64"
                     height="64"
                     src={props.song.album.album_art_url}
                     alt={props.song.album.title}/>
                <div className="song-artist">{props.song.artist.name}</div>
            </div>
            <div className="song-right">
                <div className="song-title">{props.song.title}</div>
                <div className="song-album">{props.song.album.title}</div>
                <div className="song-duration">{displayDuration(props.song.duration)}</div>
            </div>
        </li>
    );
}

function displayDuration(duration) {
    const minutes = parseInt(duration / 60);
    const seconds = ("0" + (duration % 60)).slice(-2);
    return `${minutes}:${seconds}`;
}

SongListItem.propTypes = {
    song: PropTypes.object.isRequired
};

export default SongListItem;