import React from 'react';
import PropTypes from 'prop-types';
import cx from 'classnames';
import cs from './Col.module.scss';

const propTypes = {
  tag: PropTypes.string,
  className: PropTypes.string,
  xs: PropTypes.number,
  sm: PropTypes.number,
  md: PropTypes.number,
  lg: PropTypes.number,
  xl: PropTypes.number,
  xsOffset: PropTypes.number,
  smOffset: PropTypes.number,
  mdOffset: PropTypes.number,
  lgOffset: PropTypes.number,
  xlOffset: PropTypes.number,
  xsOrder: PropTypes.number,
  smOrder: PropTypes.number,
  mdOrder: PropTypes.number,
  lgOrder: PropTypes.number,
  xlOrder: PropTypes.number,
  // hiddenXs: PropTypes.bool,
  // hiddenSm: PropTypes.bool,
  // hiddenMd: PropTypes.bool,
  // hiddenLg: PropTypes.bool,
  // hiddenXl: PropTypes.bool,
};

const defaultProps = {
  tag: 'div',
};

const Col = ({
  tag: Tag,
  className,
  xs,
  sm,
  md,
  lg,
  xl,
  xsOffset,
  smOffset,
  mdOffset,
  lgOffset,
  xlOffset,
  ...attributes
}) => {
  // FIXME: Make this more programmatic
  const classes = cx(
    cs.Col,
    xs && cs[`Col--xs-${xs}`],
    sm && cs[`Col--sm-${sm}`],
    md && cs[`Col--md-${md}`],
    lg && cs[`Col--lg-${lg}`],
    xl && cs[`Col--xl-${xl}`],
    xsOffset && cs[`Col--offset-xs-${xsOffset}`],
    smOffset && cs[`Col--offset-sm-${smOffset}`],
    mdOffset && cs[`Col--offset-md-${mdOffset}`],
    lgOffset && cs[`Col--offset-lg-${lgOffset}`],
    xlOffset && cs[`Col--offset-xl-${xlOffset}`],
    className
  );
  return <Tag className={classes} {...attributes} />;
};

Col.propTypes = propTypes;
Col.defaultProps = defaultProps;

export default Col;
