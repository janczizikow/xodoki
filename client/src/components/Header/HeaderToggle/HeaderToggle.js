import React from 'react';
import PropTypes from 'prop-types';
import { MdMenu } from 'react-icons/md';
import classes from './HeaderToggle.module.scss';

const HeaderToggle = ({ onToggleSidebar }) => (
  <button
    type="button"
    onClick={onToggleSidebar}
    className={classes.HeaderToggle}
  >
    <MdMenu size={24} />
  </button>
);

HeaderToggle.propTypes = {
  onToggleSidebar: PropTypes.func.isRequired,
};

export default HeaderToggle;
