import React from 'react';
import _ from 'lodash';

type Props = {
  user: object
}

export default class Setup extends React.Component {
  props: Props

  constructor() {
    super();

    this.state = {
      emailAddress: "",
      services: ["lastfm", "spotify"]
    }
  }

  shouldComponentUpdate(nextProps, nextState) {
    debugger;
    if (nextProps.user != this.props.user) {
      return true;
    }
    return false;
  }

  services() {
    return _.map(this.state.services, (service) => {
      if (this.props.user[`${service}_auth_object`]) {
        return (
          <div>bananan</div>
        );
      } else {
        return (
          <a href={`/auth/${service}`} key={service}>
            {service}
          </a>
        );
      }
    });
  }

  render() {
    return (
      <div className="introduction">
        <p>
          In order to use this tool, you will need to connect your last.fm and Spotify accounts.
        </p>

        <section className="services">
          {this.services()}
        </section>
      </div>
    )
  }
}