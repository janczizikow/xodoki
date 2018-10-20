import React from 'react';
import Banner from '../Banner';
import { Container, Row, Col } from '../Grid';
import withErrorBoundary from '../../hoc/withErrorBoundary';
import classes from './Page.module.scss';

const Page = ({ title, content }) => (
  <>
    <Banner sm title={title} />
    <section className={classes.Page}>
      <Container>
        <Row>
          <Col lgOffset={2} lg={8}>
            <div dangerouslySetInnerHTML={{ __html: content }} />
          </Col>
        </Row>
      </Container>
    </section>
  </>
);

export default withErrorBoundary(Page);
