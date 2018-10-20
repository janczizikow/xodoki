import * as actionTypes from '../actions/actionTypes';

const initialState = false;

const toggleSidebar = state => !state;

const reducer = (state = initialState, action) => {
  switch (action.type) {
    case actionTypes.TOGGLE_SIDEBAR:
      return toggleSidebar(state);
    default:
      return state;
  }
};

export default reducer;
