import React from 'react';
import PropTypes from 'prop-types';
import _ from 'lodash';
import ApiClient from '../api_client';

export default class Landing extends React.Component {
  constructor() {
    super();

    this.state = {
      emailAddress: ""
    };
  }

  user = () => {
    return window.__INITIAL_STATE__.user;
  }

  services = () => {
    return _.map(this.props.services, (s) => {
      if (this.user()[`${s}_auth_object`]) {
        return (
          <a className="serviceConnectButton connected">
            {s} ✅
          </a>
        );
      }
      else {
        return (
          <a className="serviceConnectButton" key={s} href={ `/auth/${s}` }>
            {s}
          </a>
        )
      }
    });
  }

  handleValue = (e) => {
    this.setState({
      emailAddress: e.target.value
    });
  }

  onSubmit = (e) => {
    ApiClient.post("imports/create", {
      token: this.user()["token"]
    }).then((data) => {
      console.log(data);
      window.location.href = "/complete";
    },
    (error) => {
      console.log("err");
      console.log(error);
    });
  }

  import = () => {
    if (!this.user()["spotify_auth_object"] && !this.user()["lastfm_auth_object"]) {
      return (null);
    }
    return (
      <div className="form">
        <h1>
          Enter your email
        </h1>

        <p>
          <input type="text" name="email" onChange={this.handleValue} />
        </p>

        <p>
          <button type="submit" onClick={this.onSubmit}>Begin import</button>
        </p>
      </div>
    );
  }

  render() {
    return (
      <section>
        <div className="services">
          {this.services()}
        </div>

        {this.import()}
      </section>
    );
  }
}

Landing.propTypes = {
  services: PropTypes.array
}
