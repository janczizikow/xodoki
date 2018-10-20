import 'react-app-polyfill/ie11';
import React from 'react';
import ReactDOM from 'react-dom';
import 'normalize.css';
import './styles/index.scss';
import Root from './components/Root';
import configureStore from './store/configureStore';
import * as serviceWorker from './serviceWorker';

const store = configureStore();
ReactDOM.hydrate(<Root store={store} />, document.getElementById('root'));
serviceWorker.register();
