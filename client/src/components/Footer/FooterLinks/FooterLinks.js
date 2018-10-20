import React from 'react';
import PropTypes from 'prop-types';
import FooterLink from '../FooterLink';

const FooterLinks = ({ footerLinks }) => (
  <nav>
    {footerLinks &&
      footerLinks.map(link => (
        <FooterLink key={link.slug} to={link.slug}>
          {link.name}
        </FooterLink>
      ))}
  </nav>
);

FooterLinks.propTypes = {
  footerLinks: PropTypes.arrayOf(
    PropTypes.shape({
      to: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
};

export default FooterLinks;
