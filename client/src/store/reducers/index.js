import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';
import authReducer from './auth';
import hikesReducer from './hikes';
import sidebarReducer from './sidebar';

const rootReducer = combineReducers({
  auth: authReducer,
  hikes: hikesReducer,
  sidebar: sidebarReducer,
  form: formReducer,
});

export default rootReducer;
