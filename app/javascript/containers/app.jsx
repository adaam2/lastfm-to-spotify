import React from 'react';
import { connect }  from 'react-redux';

import * as actions from 'actions/app';
import styles from './app.scss';

import Setup from '../components/setup';

type Props = {
  dispatch: () => void,
  loaded: boolean,
  user: object
}

class App extends React.Component {
  props: Props;

  componentDidMount() {
    this.props.dispatch(actions.loadApp());
    this.props.dispatch(actions.fetchUser())
  }

  render() {
    if(!this.props.user) {
      return null;
    }
    return <Setup user={this.props.user} />
  }
}

export default connect((store, props) => {
  return {
    loaded: store.app.loaded,
    user: store.app.user
  };
})(App);