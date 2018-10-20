import React from 'react';
import PropTypes from 'prop-types';
import cx from 'classnames';
import classes from './Input.module.scss';

const Input = React.forwardRef(({ tag: Tag, block, invalid, ...rest }, ref) => (
  <Tag
    ref={ref}
    className={cx(
      classes.Input,
      block && classes['Input--block'],
      invalid && classes['Input--invalid']
    )}
    {...rest}
  />
));

Input.propTypes = {
  tag: PropTypes.string,
  type: PropTypes.string,
  block: PropTypes.bool,
};

Input.defaultProps = {
  tag: 'input',
  type: 'text',
  block: true,
};

export default Input;
