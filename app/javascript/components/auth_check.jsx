import LocalStorageService from '../local_storage_service';
import React from 'react';
import PropTypes from 'prop-types';
import _ from 'lodash';

export default class AuthCheck extends React.Component {


  render() {
    if (LocalStorageService.hasKey("lastfmtospotify")) {
      location.href = "/setup";
    }
    else {
      location.href = "/auth/create";
    }

    return (
      <div>
        <h1>
          Checking for a previous session...
        </h1>
      </div>
    );
  }
}