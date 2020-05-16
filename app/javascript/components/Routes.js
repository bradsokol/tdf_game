import React from 'react';
import { Switch, Route } from 'react-router-dom'

import Overall from './Overall';
import Stages from './Stages';
import Teams from './Teams';

function Routes() {
  return(
    <Switch>
      <Route exact path="/" render={() => <Overall/>} />
      <Route path="/overall/2019" render={() => <Overall/>} />
      <Route path="/stages/2019/:stageNumber" render={() => <Stages/>} />
      <Route path="/players/2019/:teamId" render={() => <Teams/>} />
    </Switch>
  );
}

export default Routes;
