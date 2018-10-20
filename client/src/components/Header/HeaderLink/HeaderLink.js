import React from 'react';
import PropTypes from 'prop-types';
import { NavLink } from 'react-router-dom';
import classes from './HeaderLink.module.scss';

const HeaderLink = ({ to, ...rest }) => (
  <NavLink
    className={classes.HeaderLink}
    activeClassName={classes['HeaderLink--active']}
    to={to}
    {...rest}
  />
);

HeaderLink.propTypes = {
  to: PropTypes.string.isRequired,
};

export default HeaderLink;
