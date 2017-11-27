import React from 'react';
import PropTypes from 'prop-types';
import _ from 'lodash';

export default class Landing extends React.Component {
  services = () => {
    return _.map(this.props.services, (s) => {
      return (
        <a className="serviceConnectButton" key={s} href={ `/auth/${s}` }>
          {s}
        </a>
      )
    });
  }

  render() {
    return (
      <div className="services">
        {this.services()}
      </div>
    );
  }
}

Landing.propTypes = {
  services: PropTypes.array
}