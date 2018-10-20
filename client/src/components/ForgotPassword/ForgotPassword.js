import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { Field, reduxForm } from 'redux-form';
import { Container, Row, Col } from '../Grid';
import FormInput from '../FormInput';
import Button from '../Button';
import classes from './ForgotPassword.module.scss';
import { validate } from '../../utils';

class ForgotPassword extends Component {
  state = {
    reseting: true,
    error: null,
  };

  submit = values => {
    axios
      .post('/api/v1/auth/password', {
        user: {
          email: values.email,
        },
      })
      .then(response => {
        console.log(response);
      })
      .catch(error => {});
  };

  render() {
    const { submitting, handleSubmit } = this.props;
    return (
      <div className={classes.ForgotPassword}>
        <Container>
          <Row>
            <Col mdOffset={2} lgOffset={4} md={8} lg={4}>
              <div className={classes.ForgotPassword__card}>
                <h2>Восстановление доступа</h2>
                <form onSubmit={handleSubmit(this.submit)}>
                  <Field
                    label="Email"
                    name="email"
                    type="email"
                    component={FormInput}
                  />
                  <Button type="submit" block disabled={submitting}>
                    Send
                  </Button>
                </form>
              </div>
              <div style={{ textAlign: 'center' }}>
                <Link to="/login" className={classes.ForgotPassword__link}>
                  Уже есть аккаунт? Войти
                </Link>
              </div>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}

export default reduxForm({ form: 'forgotPassword', validate })(ForgotPassword);
