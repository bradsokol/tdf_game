import { Link } from 'react-router-dom'
import Nav from "react-bootstrap/Nav"
import React from "react"

import gql from 'graphql-tag';
import { useQuery } from '@apollo/react-hooks';

export const GET_STAGES_QUERY = gql`
  query getStages($year: Int!) {
    tours(year: $year) {
      stages {
        id
        number
        gameStage
      }
      gamePlayers {
        id
        name
      }
    }
  }
`

function SideNav() {
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

  const firstTeam = tours[0].gamePlayers.sort((a, b) => a.name.localeCompare(b.name))[0];
  const teamPath = `/players/2019/${firstTeam.id}`;

  return (
    <React.Fragment>
      <div className="container-fluid">
        <div className="row">
          <Nav activekey="Overall" className="flex-column col-md-2 d-done d-md-block bg-light sidebar">
            <Nav.Item>
              <Link className="nav-link" to='/overall/2019'>Overall</Link>
            </Nav.Item>
            <Nav.Item>
              <Link className="nav-link" to={stagePath}>Stages</Link>
            </Nav.Item>
            <Nav.Item>
              <Link className="nav-link" to={teamPath}>Teams</Link>
            </Nav.Item>
          </Nav>
        </div>
      </div>
    </React.Fragment>
  );
}

export default SideNav
