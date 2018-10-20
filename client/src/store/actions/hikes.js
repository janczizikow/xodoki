import axios from 'axios';
import * as actionTypes from './actionTypes';

export const fetchHikesInit = () => ({
  type: actionTypes.FETCH_HIKES_INIT,
});

export const fetchHikesSuccess = hikes => ({
  type: actionTypes.FETCH_HIKES_SUCCESS,
  hikes,
});

export const fetchHikesFail = error => ({
  type: actionTypes.FETCH_HIKES_FAIL,
  error,
});

export const fetchHikes = () => dispatch => {
  dispatch(fetchHikesInit());
  axios
    .get('/api/v1/hikes')
    .then(response => {
      dispatch(fetchHikesSuccess(response.data));
    })
    .catch(error => {
      dispatch(fetchHikesFail(error.response.data.error));
    });
};
