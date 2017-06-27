import React from 'react';
import PropTypes from 'prop-types';

function SongListItem(props) {
    return (
        <li>
            {props.song.title}
        </li>
    );
}

SongListItem.propTypes = {
    song: PropTypes.object.isRequired
};

export default SongListItem;