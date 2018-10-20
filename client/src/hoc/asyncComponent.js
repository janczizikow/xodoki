import React, { Component } from 'react';

const asyncComponent = importComponent =>
  class extends Component {
    state = {
      component: null,
    };

    componentDidMount() {
      importComponent().then(cmp => {
        this.setState({
          component: cmp.default,
        });
      });
    }

    render() {
      const { component: Cmp } = this.state;

      return Cmp ? <Cmp {...this.props} /> : null;
    }
  };

export default asyncComponent;
