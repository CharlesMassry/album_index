import React from 'react';
import PropTypes from 'prop-types';

function SearchInput(props) {
    return <input type="text"
                  className="search-input"
                  {...props}
                  id={`${props.name}_input`}
    />
}

SearchInput.propTypes = {
    placeholder: PropTypes.string,
    name: PropTypes.string.isRequired,
    value: PropTypes.string,
    onChange: PropTypes.func.isRequired
};

export default SearchInput;
