import React from 'react';
import PropTypes from 'prop-types';
import { MdAccountCircle } from 'react-icons/md';
import HeaderLink from '../HeaderLink';
import classes from './HeaderLinks.module.scss';

const HeaderLinks = ({ links, isAuth }) => (
  <nav className={classes.HeaderLinks}>
    <HeaderLink exact to="/">
      Походы
    </HeaderLink>
    {links &&
      links.map(link => (
        <HeaderLink key={link.slug} to={link.slug}>
          {link.name}
        </HeaderLink>
      ))}
    {!isAuth ? (
      <HeaderLink to="/login">
        <MdAccountCircle size={24} />
      </HeaderLink>
    ) : (
      <HeaderLink to="/logout">Logout</HeaderLink>
    )}
  </nav>
);

HeaderLinks.propTypes = {
  links: PropTypes.arrayOf(
    PropTypes.shape({
      to: PropTypes.string.isRequired,
      slug: PropTypes.string.isRequired,
    })
  ).isRequired,
  isAuth: PropTypes.bool.isRequired,
};

export default HeaderLinks;
