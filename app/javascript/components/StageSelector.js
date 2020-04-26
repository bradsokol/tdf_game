import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import gql from 'graphql-tag';
import React, { useState } from "react"
import Row from 'react-bootstrap/Row'
import { useQuery } from '@apollo/react-hooks';

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

function StageSelector() {
  const [stageIndex, setStageIndex] = useState(0);
  const [stages, setStages] = useState([]);

  function onStageSelected(event) {
    setStageIndex(event.target.value);
  }

  function stageDescription(stage) {
    const date = new Date(Date.parse(stage.date + "T06:00:00Z"))
    const options = { month: 'long', day: 'numeric' }
    return `Stage ${stage.number} - ${date.toLocaleDateString(date, options)} - ` +
      `${stage.startTown} to ${stage.finishTown} - ${stage.distance} km`
  }

  const year = 2019;
  const { loading, error, data } = useQuery(
    GET_STAGES_QUERY,
    { variables: { year } }
  );

  if (loading) return <div><p>Loading...</p></div>;
  if (error) return <div><strong>Error:</strong> {error.toString()}</div>;

  const { tours } = data;
  if (stages.length == 0) {
    setStages(tours[0].stages.filter(stage => stage.gameStage == true));
  }
  const stage = stages[stageIndex];

  return (
    <Container>
      <Row>
        <Col lg={1}>
          <p>
            <select name="stages" onChange={onStageSelected}>
              {stages.map((stage, index) => {
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

export default StageSelector
