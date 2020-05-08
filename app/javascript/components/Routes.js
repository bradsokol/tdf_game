import React from 'react';
import { Switch, Route } from 'react-router-dom'

import gql from 'graphql-tag';
import { useQuery } from '@apollo/react-hooks';

import Overall from './Overall';
import Stages from './Stages';
import Teams from './Teams';

export const GET_STAGES_QUERY = gql`
  query getStages($year: Int!) {
    tours(year: $year) {
      stages {
        id
        number
        gameStage
      }
    }
  }
`

function Routes() {
  const year = 2019;
  const { loading, error, data } = useQuery(
    GET_STAGES_QUERY,
    { variables: { year } }
  );

  if (loading || error) return <div/>;

  const { tours } = data;
  const firstGameStage = tours[0].stages
    .filter(stage => stage.gameStage === true)
    .sort((a, b) => a.number - b.number )[0];
  const stagePath = `/stages/2019/${firstGameStage.number}`;

  return(
    <Switch>
      <Route exact path="/" render={() => <Overall/>} />
      <Route path="/overall/2019" render={() => <Overall/>} />
      <Route path={stagePath} render={() => <Stages/>} />
      <Route path="/players/2019" render={() => <Teams/>} />
    </Switch>
  );
}

export default Routes;
