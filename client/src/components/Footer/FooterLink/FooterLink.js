import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';
import classes from './FooterLink.module.scss';

const FooterLink = ({ to, ...rest }) => (
  <Link className={classes.FooterLink} to={to} {...rest} />
);

FooterLink.propTypes = {
  to: PropTypes.string.isRequired,
};

export default FooterLink;
