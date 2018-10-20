import React from 'react';
import PropTypes from 'prop-types';
import cx from 'classnames';
import classes from './Label.module.scss';

const Label = ({ htmlFor, invalid, ...rest }) => (
  <label
    htmlFor={htmlFor}
    className={cx(classes.Label, invalid && classes['Label--invalid'])}
    {...rest}
  />
);

Label.propTypes = {
  htmlFor: PropTypes.string.isRequired,
};

export default Label;
