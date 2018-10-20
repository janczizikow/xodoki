import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import Header from '../../components/Header';
import Sidebar from '../../components/Sidebar';
import Footer from '../../components/Footer';
import * as actions from '../../store/actions';
import classes from './Layout.module.scss';

const Layout = ({ children, isAuth, isSidebarOpen, toggleSidebar }) => (
  <div className={classes.Layout}>
    <Header isAuth={isAuth} onToggleSidebar={toggleSidebar} />
    <Sidebar
      isOpen={isSidebarOpen}
      isAuth={isAuth}
      onToggleSidebar={toggleSidebar}
    />
    <main className={classes.Layout__content}>{children}</main>
    <Footer />
  </div>
);

Layout.propTypes = {
  children: PropTypes.node.isRequired,
  isAuth: PropTypes.bool.isRequired,
  isSidebarOpen: PropTypes.bool.isRequired,
  toggleSidebar: PropTypes.func.isRequired,
};

const mapStateToProps = state => ({
  isAuth: state.auth.token !== null,
  isSidebarOpen: state.sidebar,
});

const mapDispatchToProps = dispatch => ({
  toggleSidebar: () => dispatch(actions.toggleSidebar()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Layout);
