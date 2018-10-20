import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Layout from './containers/Layout';
import asyncComponent from './hoc/asyncComponent';
import Home from './containers/Home';
import Logout from './containers/Logout';

const AsyncLogin = asyncComponent(() => import('./containers/Login'));
const AsyncNotFound = asyncComponent(() => import('./components/NotFound'));
const AsyncHike = asyncComponent(() => import('./components/Hike'));
const AsyncPage = asyncComponent(() => import('./components/Page'));
const AsyncForgotPassword = asyncComponent(() =>
  import('./components/ForgotPassword')
);
const AsyncResetPassword = asyncComponent(() =>
  import('./containers/ResetPassword')
);

const App = () => (
  <Layout>
    <Switch>
      <Route exact path="/" component={Home} />
      <Route path="/login" component={AsyncLogin} />
      <Route path="/logout" component={Logout} />
      <Route path="/forgot-password" component={AsyncForgotPassword} />
      <Route path="/reset-password" component={AsyncResetPassword} />
      <Route path="/404" component={AsyncNotFound} />
      <Route path="/pohody/:slug" component={AsyncHike} />
      <Route path="/:slug" component={AsyncPage} />
      <Route component={AsyncNotFound} />
    </Switch>
  </Layout>
);

export default App;
