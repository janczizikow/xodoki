import * as actionTypes from '../actions/actionTypes';

const initialState = {
  token: null,
  loading: false,
  error: null,
};

const authInit = state => ({
  ...state,
  loading: true,
});

const authSuccess = (state, action) => ({
  ...state,
  loading: false,
  error: null,
  token: action.token,
});

const authFail = (state, action) => ({
  ...state,
  loading: false,
  error: action.error,
});

const authLogout = state => ({
  ...state,
  token: null,
});

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.AUTH_INIT:
      return authInit(state);
    case actionTypes.AUTH_SUCCESS:
      return authSuccess(state, action);
    case actionTypes.AUTH_FAIL:
      return authFail(state, action);
    case actionTypes.AUTH_LOGOUT:
      return authLogout(state);
    default:
      return state;
  }
};

export default reducer;
