import React from 'react';
import PropTypes from 'prop-types';

import backArrow from '../images/back-arrow.svg';

function Header(props) {
    return (
        <div className="header">
            { props.showBackButton && <div className="header-back-button" onClick={props.onBackButtonClick}><img src={backArrow}/></div> }
            <h3 className={`header-title ${ props.showBackButton && 'back'}`}>Album Index</h3>
        </div>
    )
}

Header.propTypes = {
    showBackButton: PropTypes.bool.isRequired,
    onBackButtonClick: PropTypes.func.isRequired
};


export default Header;
