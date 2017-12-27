import { APP_LOAD, FETCH_USER_SUCCESS } from 'constants/action-types';

const initialState = {
  loaded: false,
  user: {}
};

export default function app(state = initialState, action) {
  switch (action.type) {
    case APP_LOAD:
      return { ...state, loaded: true };
    case FETCH_USER_SUCCESS:
      return { ...state, user: action.user };
    default:
      return state;
  }
}