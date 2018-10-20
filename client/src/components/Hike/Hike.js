import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import axios from 'axios';
import { Container, Row, Col } from '../Grid';
import Spinner from '../Spinner';
import classes from './Hike.module.scss';
import * as actions from '../../store/actions';

class Hike extends Component {
  state = {
    hike: null,
  };

  componentDidMount() {
    const {
      hikes,
      fetchHikes,
      match: {
        params: { slug },
      },
    } = this.props;
    let hike;

    if (hikes) {
      hike = hikes.find(el => el.slug === slug);
    } else {
      axios
        .get(`/api/v1/hikes/${slug}`)
        .then(response => {
          hike = response.data;
          this.setState({ hike });
          fetchHikes();
        })
        .catch(error => {
          console.log(error);
        });
    }
    this.setState({ hike });
  }

  render() {
    const { hike } = this.state;
    let hikeDOM = <Spinner />;

    if (hike) {
      hikeDOM = (
        <>
          <h2>{hike.title}</h2>
          <p>{hike.title}</p>
        </>
      );
    }

    return (
      <div className={classes.Hike}>
        <Container>
          <Row>
            <Col lgOffset={2} lg={8}>
              <div className={classes.Hike__card}>{hikeDOM}</div>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  hikes: state.hikes.hikes,
});

const mapDispatchToProps = dispatch => ({
  fetchHikes: () => dispatch(actions.fetchHikes()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Hike);
