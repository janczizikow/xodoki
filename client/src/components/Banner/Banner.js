import React from 'react';
import { Container } from '../Grid';
import classes from './Banner.module.scss';

const Banner = () => (
  <div className={classes.Banner}>
    <Container>
      <p>content here</p>
    </Container>
  </div>
);

export default Banner;
