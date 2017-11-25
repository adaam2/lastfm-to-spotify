import React from 'react';
import PropTypes from 'prop-types';
import _ from 'lodash';

export default class Landing extends React.Component {
  services = () => {
    return _.map(this.props.services, (s) => {
      return (
        <div className={ `service ${s}` }>
          <a href={ `/auth/${s}` }>
            {s}
          </a>
        </div>
      )
    });
  }

  render() {
    return (
      <div>
        <h1>
          Get started
        </h1>

        <div>
          {this.services()}
        </div>
      </div>
    );
  }
}

Landing.propTypes = {
  services: PropTypes.array
}