import React, { Component } from 'react';
import PropTypes from 'prop-types';
import {
  disableBodyScroll,
  enableBodyScroll,
  clearAllBodyScrollLocks,
} from 'body-scroll-lock';
import CSSTransition from 'react-transition-group/CSSTransition';
import { MdClose } from 'react-icons/md';
import SidebarLink from './SidebarLink';
import Overlay from '../Overlay';
import classes from './Sidebar.module.scss';

class Sidebar extends Component {
  targetElement = null;

  componentDidUpdate() {
    const { isOpen } = this.props;
    if (isOpen) {
      this.targetElement = document.querySelector(`.${classes.Sidebar}`);
      this.handleOpen();
    } else {
      this.handleClose();
    }
  }

  componentWillUnmount() {
    // to play it safe
    clearAllBodyScrollLocks();
  }

  handleOpen = () => {
    disableBodyScroll(this.targetElement);
    document.addEventListener('keydown', this.handleKeyDown);
  };

  handleClose = () => {
    enableBodyScroll(this.targetElement);
    document.removeEventListener('keydown', this.handleKeyDown);
  };

  handleKeyDown = e => {
    const { onToggleSidebar } = this.props;
    if (e.keyCode === 27) {
      onToggleSidebar();
    }
  };

  render() {
    const { isAuth, isOpen, onToggleSidebar } = this.props;

    return (
      <>
        <CSSTransition
          in={isOpen}
          timeout={250}
          appear
          mountOnEnter
          unmountOnExit
          classNames={{
            enter: classes['Sidebar--enter'],
            enterActive: classes['Sidebar--enter-active'],
            exitActive: classes['Sidebar--exit-active'],
          }}
        >
          <div className={classes.Sidebar}>
            <button
              type="button"
              onClick={onToggleSidebar}
              className={classes.Sidebar__closeBtn}
            >
              <MdClose size={24} />
            </button>
            <SidebarLink exact to="/" onClick={onToggleSidebar}>
              Походы
            </SidebarLink>
            {!isAuth ? (
              <SidebarLink to="/login" onClick={onToggleSidebar}>
                Логин
              </SidebarLink>
            ) : (
              <SidebarLink to="/logout" onClick={onToggleSidebar}>
                Logout
              </SidebarLink>
            )}
          </div>
        </CSSTransition>
        <Overlay isOpen={isOpen} onClick={onToggleSidebar} />
      </>
    );
  }
}

Sidebar.propTypes = {
  isOpen: PropTypes.bool.isRequired,
  onToggleSidebar: PropTypes.func.isRequired,
};

export default Sidebar;
