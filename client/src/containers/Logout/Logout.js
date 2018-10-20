import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { Redirect } from 'react-router-dom';
import * as actions from '../../store/actions';

class Logout extends Component {
  componentDidMount() {
    const { logout } = this.props;
    logout();
  }

  render() {
    return <Redirect to="/" />;
  }
}

Logout.propTypes = {
  logout: PropTypes.func.isRequired,
};

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(actions.authLogout()),
});

export default connect(
  null,
  mapDispatchToProps
)(Logout);
