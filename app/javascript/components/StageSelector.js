import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Dropdown from 'react-bootstrap/Dropdown'
import DropdownButton from 'react-bootstrap/DropdownButton'
import gql from 'graphql-tag';
import PropTypes from "prop-types"
import { Query } from 'react-apollo';
import React from "react"
import Row from 'react-bootstrap/Row'

import StageResults from './StageResults'

const GET_STAGES = gql`
  {
    tours(year: 2019) {
      stages {
        number
        date
        startTown
        finishTown
        distance
        stageType
      }
    }
  }
`

function StageDescription({ stage }) {
  var text = ''
  if (stage != null) {
    const date = new Date(Date.parse(stage.date + "T06:00:00Z"))
    const options = { month: 'short', day: 'numeric' }
    text = "Stage " + stage.number + " - " +
      date.toLocaleDateString(date, options) + " - " +
      stage.startTown + " to " + stage.finishTown + " - " +
      stage.distance + " km"
  }

  return (
    <p>{text}</p>
  )
}

class StageSelector extends React.Component {
  constructor() {
    super();
    this.state = { stages: [], stageIndex: -1 };
    this.onStageSelected = this.onStageSelected.bind(this);
  }

  formatStage(stage) {
    const options = { weekday: 'short', month: 'short', day: 'numeric' };
    const date = new Date(Date.parse(stage.date + "T06:00:00Z"))
    return stage.number + " - " + date.toLocaleDateString(date, options);
  }

  onStageSelected(index) {
    this.setState(() => ({ stageIndex: index }));
  }

  render () {
    return (
      <React.Fragment>
        <Query query={GET_STAGES}>
          {({ data, loading, error }) => {

            if (error) {
              return <div><strong>Error:</strong> {error.toString()}</div>
            }

            if (loading || !data) {
              return <div/>
            }

            const { tours } = data;
            this.state.stages = tours[0].stages;

            const stage = this.state.stages[this.state.stageIndex];
            return(
              <Container>
                <Row>
                  <Col lg={1}>
                    <DropdownButton id="stage-selector" size="sm" title="Stage" onSelect={this.onStageSelected}>
                      {this.state.stages.map((stage, index) => {
                        return (
                          <Dropdown.Item eventKey={index} key={index}>{this.formatStage(stage)}</Dropdown.Item>
                        )
                      })}
                    </DropdownButton>
                  </Col>
                  <Col>
                    <StageDescription stage={stage}/>
                  </Col>
                </Row>
                <Row>
                  <StageResults stage={stage}/>
                </Row>
              </Container>
            );
          }}
        </Query>
      </React.Fragment>
    );
  }
}

export default StageSelector
