import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';
import cx from 'classnames';
import cs from './Button.module.scss';

const propTypes = {
  to: PropTypes.string,
  onClick: PropTypes.func,
  disabled: PropTypes.bool,
  link: PropTypes.bool,
  block: PropTypes.bool,
  outline: PropTypes.bool,
  rounded: PropTypes.bool,
  loading: PropTypes.bool,
  color: PropTypes.oneOf(['primary', 'secondary', 'success', 'error', 'dark']),
};

const defaultProps = {
  color: 'primary',
};

class Button extends Component {
  onClick = e => {
    const { disabled, loading, onClick } = this.props;

    if (disabled || loading) {
      e.preventDefault();
    } else {
      onClick && onClick(e);
    }
  };

  render() {
    const {
      to,
      disabled,
      loading,
      block,
      link,
      outline,
      rounded,
      color,
      className,
      ...atributes
    } = this.props;

    const Tag = to ? Link : 'button';

    const classes = cx(
      cs.Btn,
      block && cs['Btn--block'],
      rounded && cs['Btn--rounded'],
      outline ? cs[`Btn--outline-${color}`] : cs[`Btn--${color}`],
      loading && cs[`Btn--loading Btn--loading-${color}`],
      link && cs['Btn--link'],
      className
    );

    return (
      <Tag
        to={to}
        {...atributes}
        className={classes}
        disabled={disabled}
        onClick={this.onClick}
      />
    );
  }
}

Button.propTypes = propTypes;
Button.defaultProps = defaultProps;

export default Button;
