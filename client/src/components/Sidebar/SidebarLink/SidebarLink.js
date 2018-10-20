import React from 'react';
import PropTypes from 'prop-types';
import { NavLink } from 'react-router-dom';
import classes from './SidebarLink.module.scss';

const SidebarLink = ({ to, ...rest }) => (
  <NavLink
    className={classes.SidebarLink}
    activeClassName={classes['SidebarLink--active']}
    to={to}
    {...rest}
  />
);

SidebarLink.propTypes = {
  to: PropTypes.string.isRequired,
};

export default SidebarLink;
