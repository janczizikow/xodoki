import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import Banner from '../../components/Banner';
import { Container, Row, Col } from '../../components/Grid';
import Card from '../../components/Card';
import Spinner from '../../components/Spinner';
import classes from './Home.module.scss';
import * as actions from '../../store/actions';

class Home extends Component {
  componentDidMount() {
    const { hikes, fetchHikes } = this.props;
    if (!hikes) {
      fetchHikes();
    }
  }

  render() {
    const { hikes } = this.props;
    let hikesDOM = <Spinner />;

    if (hikes) {
      hikesDOM =
        hikes.length > 0 ? (
          <Row>
            {hikes.map(hike => (
              <Col key={hike.id} sm={6} md={4} lg={3}>
                <Card tag={Link} to={`pohody/${hike.slug}`}>
                  {hike.title}
                </Card>
              </Col>
            ))}
          </Row>
        ) : (
          <p>Нет походов</p>
        );
    }

    return (
      <>
        <Banner />
        <div className={classes.Home}>
          <Container>{hikesDOM}</Container>
        </div>
      </>
    );
  }
}

Home.propTypes = {
  hikes: PropTypes.arrayOf(
    PropTypes.shape({
      title: PropTypes.string,
    }).isRequired
  ).isRequired,
  fetchHikes: PropTypes.func.isRequired,
};

const mapStateToProps = state => ({
  hikes: state.hikes.hikes,
  loading: state.hikes.loading,
  error: state.hikes.error,
});

const mapDispatchToProps = dispatch => ({
  fetchHikes: () => dispatch(actions.fetchHikes()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Home);
