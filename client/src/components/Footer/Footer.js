import React from 'react';
import { Container } from '../Grid';
import FooterLinks from './FooterLinks';
import { ReactComponent as Logo } from '../../assets/logo.svg';
import classes from './Footer.module.scss';

const Footer = () => (
  <footer className={classes.Footer}>
    <Container>
      <div className={classes.Footer__inner}>
        <div>
          <Logo />
          <div className={classes.Footer__legal}>
            &copy;
            {` ${new Date().getFullYear()} `}
            Ходки. Все права защищены.
          </div>
        </div>
        <FooterLinks />
      </div>
    </Container>
  </footer>
);

export default Footer;
