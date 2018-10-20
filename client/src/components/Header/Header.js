import React from 'react';
import PropTypes from 'prop-types';
import { Link } from 'react-router-dom';
import { Container } from '../Grid';
import HeaderToggle from './HeaderToggle';
import HeaderLinks from './HeaderLinks';
import { ReactComponent as Logo } from '../../assets/logo.svg';
import classes from './Header.module.scss';

const Header = ({ onToggleSidebar, isAuth }) => (
  <header className={classes.Header}>
    <Container>
      <div className={classes.Header__inner}>
        <Link to="/" className={classes.Header__link}>
          <Logo />
        </Link>
        <HeaderToggle onToggleSidebar={onToggleSidebar} />
        <HeaderLinks isAuth={isAuth} />
      </div>
    </Container>
  </header>
);

Header.propTypes = {
  onToggleSidebar: PropTypes.func.isRequired,
  isAuth: PropTypes.bool.isRequired,
};

export default Header;
