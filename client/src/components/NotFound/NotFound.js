import React from 'react';
import { Container, Row, Col } from '../Grid';
import classes from './NotFound.module.scss';

const NotFound = () => (
  <div className={classes.NotFound}>
    <Container>
      <Row>
        <Col>
          <div className={classes.NotFound__inner}>
            <h1>Нет такой страницы</h1>
            <p>The page you are looking for doesn&apos;t seem to exist…</p>
          </div>
        </Col>
      </Row>
    </Container>
  </div>
);

export default NotFound;
