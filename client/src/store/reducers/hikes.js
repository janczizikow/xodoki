import * as actionTypes from '../actions/actionTypes';

const initialState = {
  hikes: null,
  loading: false,
  error: null,
};

const fetchHikesInit = state => ({
  ...state,
  loading: true,
});

const fetchHikesSuccess = (state, action) => ({
  ...state,
  loading: false,
  error: null,
  hikes: [...action.hikes],
});

const fetchHikesFail = (state, action) => ({
  ...state,
  loading: false,
  error: action.error,
});

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.FETCH_HIKES_INIT:
      return fetchHikesInit(state);
    case actionTypes.FETCH_HIKES_SUCCESS:
      return fetchHikesSuccess(state, action);
    case actionTypes.FETCH_HIKES_FAIL:
      return fetchHikesFail(state, action);
    default:
      return state;
  }
};

export default reducer;
