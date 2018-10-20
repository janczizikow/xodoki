import React from 'react';
import PropTypes from 'prop-types';
import cx from 'classnames';
import cs from './Row.module.scss';

const propTypes = {
  tag: PropTypes.string,
  className: PropTypes.string,
  inline: PropTypes.bool,
  wrap: PropTypes.oneOf(['no-wrap', 'wrap-reverse']),
  column: PropTypes.bool,
  reverse: PropTypes.bool,
  align: PropTypes.oneOf(['start', 'center', 'end', 'baseline', 'stretch']),
  justify: PropTypes.oneOf(['start', 'center', 'end', 'between', 'around']),
};

const defaultProps = {
  tag: 'div',
  className: null,
  inline: false,
  wrap: null,
  column: false,
  reverse: false,
  align: null,
  justify: null,
};

const Row = ({
  tag: Tag,
  className,
  inline,
  wrap,
  column,
  reverse,
  align,
  justify,
  ...attributes
}) => {
  const classes = cx(
    cs.Row,
    inline && cs['Row--inline'],
    wrap && cs[`Row--${wrap}`],
    column && cs['Row--column'],
    align && cs[`Row--align-${align}`],
    justify && cs[`Row--justify-${justify}`],
    /* eslint-disable no-nested-ternary */
    reverse
      ? column
        ? cs['Row--column-reverse']
        : cs['Row--row-reverse']
      : null,
    className
  );
  return <Tag className={classes} {...attributes} />;
};

Row.propTypes = propTypes;
Row.defaultProps = defaultProps;

export default Row;
