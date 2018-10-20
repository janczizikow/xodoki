import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Redirect, Link } from 'react-router-dom';
import { Container, Row, Col } from '../../components/Grid';
import Label from '../../components/Label';
import Input from '../../components/Input';
import Button from '../../components/Button';
import classes from './Login.module.scss';
import { checkValidity } from '../../utils';
import * as actions from '../../store/actions';

class Login extends Component {
  state = {
    loginForm: {
      email: {
        value: '',
        type: 'email',
        label: 'Email',
        touched: false,
        valid: false,
        validation: {
          required: true,
          isEmail: true,
        },
      },
      password: {
        value: '',
        type: 'password',
        label: 'Пароль',
        touched: false,
        valid: false,
        validation: {
          required: true,
          minLength: 6,
        },
      },
    },
    isFormValid: false,
  };

  handleBlur = id => {
    const {
      loginForm: { ...loginForm },
    } = this.state;
    const updatedFormElement = { ...loginForm[id] };
    updatedFormElement.touched = true;
    loginForm[id] = updatedFormElement;
    this.setState({
      loginForm,
    });
  };

  handleInput = (e, id) => {
    const {
      loginForm: { ...loginForm },
    } = this.state;
    const updatedFormElement = { ...loginForm[id] };

    updatedFormElement.value = e.target.value;
    updatedFormElement.valid = checkValidity(
      updatedFormElement.value,
      updatedFormElement.validation
    );
    loginForm[id] = updatedFormElement;

    let isFormValid = true;
    Object.keys(loginForm).forEach(key => {
      isFormValid = loginForm[key].valid && isFormValid;
    });

    this.setState({
      loginForm,
      isFormValid,
    });
  };

  handleLogin = e => {
    e.preventDefault();
    const { authenticate } = this.props;
    const { isFormValid, loginForm } = this.state;

    authenticate({
      email: loginForm.email.value,
      password: loginForm.password.value,
    });

    if (isFormValid) {
      // dispatch an action
    }
  };

  render() {
    const { loading, error, isAuth } = this.props;
    const { loginForm, isFormValid } = this.state;
    return (
      <div className={classes.Login}>
        {isAuth && <Redirect to="/" />}
        <Container>
          <Row>
            <Col mdOffset={2} lgOffset={4} md={8} lg={4}>
              <div className={classes.Login__inner}>
                <h2 style={{ textAlign: 'center', marginBottom: '2rem' }}>
                  Авторизация
                </h2>
                {error && error}
                <form onSubmit={this.handleLogin} noValidate>
                  {Object.keys(loginForm).map(key => (
                    <div key={key}>
                      <Label
                        htmlFor={key}
                        invalid={
                          !loginForm[key].valid && loginForm[key].touched
                        }
                      >
                        {loginForm[key].label}
                      </Label>
                      <Input
                        name={key}
                        type={loginForm[key].type}
                        value={loginForm[key].value}
                        invalid={
                          !loginForm[key].valid && loginForm[key].touched
                        }
                        onBlur={() => this.handleBlur(key)}
                        onChange={e => this.handleInput(e, key)}
                      />
                    </div>
                  ))}
                  <Button
                    block
                    disabled={!isFormValid}
                    loading={loading}
                    type="submit"
                  >
                    Войти
                  </Button>
                </form>
              </div>
              <div style={{ textAlign: 'center' }}>
                <Link
                  to="/forgot-password"
                  className={classes.Login__paswordLink}
                >
                  Забыли пароль?
                </Link>
              </div>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  loading: state.auth.loading,
  isAuth: state.auth.token !== null,
  error: state.auth.error,
});

const mapDispatchToProps = dispatch => ({
  authenticate: payload => dispatch(actions.auth(payload)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Login);
