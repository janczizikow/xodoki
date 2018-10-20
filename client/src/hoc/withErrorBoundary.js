import React, { Component } from 'react';
import { Redirect } from 'react-router-dom';

const withErrorBoundary = WrappedComponent =>
  class ErrorBoundary extends Component {
    state = {
      error: null,
      errorInfo: null,
    };

    componentDidCatch(error) {
      this.setState({
        error,
        errorInfo: error.message,
      });
    }

    render() {
      const { error } = this.state;

      if (error) {
        return <Redirect to="/404" />;
      }

      return <WrappedComponent {...this.props} />;
    }
  };

export default withErrorBoundary;
