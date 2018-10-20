import React from 'react';
import { Field, reduxForm } from 'redux-form';
import { Redirect } from 'react-router-dom';
import { Container, Row, Col } from '../../components/Grid';
import FormInput from '../../components/FormInput';
import Button from '../../components/Button';
import { validate } from '../../utils';
import classes from './ResetPassword.module.scss';

const ResetPassword = props => (
  <div className={classes.ResetPassword}>
    <Container>
      <Row>
        <Col mdOffset={2} lgOffset={4} md={8} lg={4}>
          <div className={classes.ResetPassword__inner}>
            <form onSubmit={props.handleSubmit}>
              <Field
                label="New Password"
                name="password"
                type="password"
                component={FormInput}
              />
              <Field
                label="Confirm your new password"
                name="password_confirmation"
                type="password"
                component={FormInput}
              />
              <Button type="submit" block>
                Reset Password
              </Button>
            </form>
          </div>
        </Col>
      </Row>
    </Container>
  </div>
);

export default reduxForm({
  form: 'resetPasword',
  validate,
})(ResetPassword);
