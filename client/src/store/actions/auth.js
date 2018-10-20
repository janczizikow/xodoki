import axios from 'axios';
import * as actionTypes from './actionTypes';

export const authInit = () => ({
  type: actionTypes.AUTH_INIT,
});

export const authSuccess = token => ({
  type: actionTypes.AUTH_SUCCESS,
  token,
});

export const authFail = error => ({
  type: actionTypes.AUTH_FAIL,
  error,
});

export const authLogout = () => ({
  type: actionTypes.AUTH_LOGOUT,
});

export const auth = payload => dispatch => {
  dispatch(authInit());
  axios
    .post('/api/v1/auth/login', {
      user: {
        email: payload.email,
        password: payload.password,
      },
    })
    .then(response => {
      dispatch(authSuccess(response));
    })
    .catch(error => {
      dispatch(authFail(error.response.data.error));
    });
};
