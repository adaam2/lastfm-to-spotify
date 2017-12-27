import { APP_LOAD, FETCH_USER, FETCH_USER_SUCCESS, FETCH_USER_ERROR } from 'constants/action-types';
import { default as ApiClient } from '../shared/api-client';
import { default as LocalStorageService } from '../shared/local-storage-service';

const LOCAL_STORAGE_KEY = "adamjamesbull.co.uk-lastfm-token";

export function loadApp() {
  return {
    type: APP_LOAD,
  };
}

// User management
function getToken() {
  return LocalStorageService.fetch(LOCAL_STORAGE_KEY) || "";
}

function fetchUserSuccess(response) {
  LocalStorageService.set(LOCAL_STORAGE_KEY, response.token);
  return {
    type: 'FETCH_USER_SUCCESS',
    user: response
  }
}

function fetchUserError(err) {
  return {
    type: 'FETCH_USER_ERROR',
    error: err
  }
}

export function fetchUser() {
  return function action(dispatch) {
    dispatch({ type: FETCH_USER })
    return ApiClient.post("auth/connect", { token: getToken() }).then(
      response => dispatch(fetchUserSuccess(response.body)),
      err => dispatch(fetchUserError(err))
    );
  }
}