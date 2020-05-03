import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import gql from 'graphql-tag';
import PropTypes from "prop-types"
import React, { useState } from "react"
import Row from 'react-bootstrap/Row'

import StageResults from './StageResults'

export const GET_STAGES_QUERY = gql`
  query getStages($year: Int!) {
    tours(year: $year) {
      stages {
        id
        number
        date
        startTown
        finishTown
        distance
        stageType
        gameStage
      }
    }
  }
`

function StageSelector(props) {
  const [stageIndex, setStageIndex] = useState(0);

  function onStageSelected(event) {
    setStageIndex(event.target.value);
    props.onStageSelected(event.target.value);
  }

  function stageDescription(stage) {
    const date = new Date(Date.parse(stage.date + "T06:00:00Z"))
    const options = { month: 'long', day: 'numeric' }
    return `Stage ${stage.number} - ${date.toLocaleDateString(date, options)} - ` +
      `${stage.startTown} to ${stage.finishTown} - ${stage.distance} km`
  }

  const stage = props.stages[stageIndex];

  return (
    <Container>
      <Row>
        <Col lg={1}>
          <p>
            <select name="stages" onChange={onStageSelected}>
              {props.stages.map((stage, index) => {
                return(
                  <option name={`stage${stage.number}`} key={index} value={index}>{stageDescription(stage)}</option>
                )
              })}
            </select>
          </p>
        </Col>
      </Row>
      <Row>
        <StageResults stage={stage}/>
      </Row>
    </Container>
  );
}

StageSelector.propTypes = {
  stages: PropTypes.arrayOf(PropTypes.object),
  onStageSelected: PropTypes.func,
};

export default StageSelector
