import React from 'react';
import PropTypes from 'prop-types';
import CSSTransition from 'react-transition-group/CSSTransition';
import classes from './Overlay.module.scss';

const Overlay = ({ isOpen, onClick }) => (
  <CSSTransition
    in={isOpen}
    timeout={250}
    appear
    mountOnEnter
    unmountOnExit
    classNames={{
      enter: classes['Overlay--enter'],
      enterActive: classes['Overlay--enter-active'],
      exitActive: classes['Overlay--exit-active'],
    }}
  >
    <div onClick={onClick} className={classes.Overlay} />
  </CSSTransition>
);

Overlay.propTypes = {
  isOpen: PropTypes.bool.isRequired,
  onClick: PropTypes.func.isRequired,
};

export default Overlay;
