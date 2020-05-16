import React, { useState } from 'react'
import gql from 'graphql-tag';
import { useParams } from 'react-router-dom';
import { useQuery } from '@apollo/react-hooks';

import Col from 'react-bootstrap/Col'
import Row from 'react-bootstrap/Row'

import history from './history';

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import SideNav from './SideNav';
import TeamSelector from './TeamSelector';
import Title from './Title';

export const GET_TEAMS_QUERY = gql`
  query getTeams($year: Int!) {
    tours(year: $year) {
      gamePlayers {
        id
        name
      }
    }
  }
`

function Teams() {
  const [selectedTeamId, setSelectedTeamId] = useState(-1);
  const [teams, setTeams] = useState([]);

  const { teamId } = useParams();

  const year = 2019;
  const { loading, error, data } = useQuery(
    GET_TEAMS_QUERY,
    { variables: { year } }
  );

  function handleTeamSelection(teamId) {
    setSelectedTeamId(parseInt(teamId));
  }

  if (loading) return <div><p>Loading...</p></div>;
  if (error) return <div><strong>Error:</strong> {error.toString()}</div>;

  if (selectedTeamId === -1) {
    setSelectedTeamId(parseInt(teamId));
  }

  if (teams.length === 0) {
    data.tours[0].gamePlayers.sort((a, b) => a.name.localeCompare(b.name));
    setTeams(data.tours[0].gamePlayers);
  }

  if (selectedTeamId != -1) {
    history.push(`/players/2019/${selectedTeamId}`);
  }

  return (
    <>
      <Title/>
      <SideNav/>
      <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
        <h2>Team Results</h2>
        <Row>
          <Col lg={1}>
            <p>
              <TeamSelector
                teams={teams}
                selectedTeamId={selectedTeamId}
                onTeamSelected={handleTeamSelection}
              />
            </p>
          </Col>
        </Row>
        <Row>
          <p>Team results for team {selectedTeamId} go here</p>
        </Row>
      </main>
    </>
  );
}

export default Teams
