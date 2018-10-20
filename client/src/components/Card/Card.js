import React from 'react';
import PropTypes from 'prop-types';
import cx from 'classnames';
import classes from './Card.module.scss';

const Card = ({ tag: Tag, className, ...rest }) => (
  <Tag className={cx(classes.Card, className)} {...rest} />
);

Card.propTypes = {
  tag: PropTypes.string,
  className: PropTypes.string,
};

Card.defaultProps = {
  tag: 'div',
  className: null,
};

export default Card;
