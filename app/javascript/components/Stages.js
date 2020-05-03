import React, { useState } from "react";
import gql from 'graphql-tag';
import { useQuery } from '@apollo/react-hooks';

import StageSelector from './StageSelector';

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
  const [stages, setStages] = useState([]);

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

  return (
    <>
      <Title/>
      <SideNav/>
      <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
        <h2>Stage Results</h2>
        <StageSelector stages={stages}/>
      </main>
    </>
  );
}

export default Stages
