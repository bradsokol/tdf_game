import React, { useState } from 'react';
import gql from 'graphql-tag';
import { useParams } from 'react-router-dom';
import { useQuery } from '@apollo/react-hooks';

import Col from 'react-bootstrap/Col'
import Container from 'react-bootstrap/Container'
import Row from 'react-bootstrap/Row'

import StageResults from './StageResults';
import StageSelector from './StageSelector';

import history from './history';

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import SideNav from './SideNav';
import Title from './Title';

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

function Stages() {
  const [selectedStageIndex, setSelectedStageIndex] = useState(-1);
  const [stages, setStages] = useState([]);

  const { stageNumber } = useParams();

  const year = 2019;
  const { loading, error, data } = useQuery(
    GET_STAGES_QUERY,
    { variables: { year } }
  );

  function handleStageSelection(stageIndex) {
    setSelectedStageIndex(parseInt(stageIndex));
  }

  if (loading) return <div><p>Loading...</p></div>;
  if (error) return <div><strong>Error:</strong> {error.toString()}</div>;

  const { tours } = data;
  if (stages.length === 0) {
    const gameStages = tours[0].stages.filter(stage => stage.gameStage === true);
    setStages(gameStages);
    const index = gameStages.findIndex((stage) => stage.number == stageNumber);
    setSelectedStageIndex(index);
  }

  let stageResults = <p>Select a stage</p>
  if (selectedStageIndex != -1) {
    stageResults = <StageResults stage={stages[selectedStageIndex]}/>
    history.push(`/stages/2019/${stages[selectedStageIndex].number}`);
  }

  return (
    <>
      <Title/>
      <SideNav/>
      <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
        <h2>Stage Results</h2>
        <Row>
          <Col lg={1}>
            <p>
              <StageSelector
                stages={stages}
                selectedStageIndex={selectedStageIndex}
                onStageSelected={handleStageSelection}
              />
            </p>
          </Col>
        </Row>
        <Row>
          {stageResults}
        </Row>
      </main>
    </>
  );
}

export default Stages
