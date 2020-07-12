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
import TeamResults from './TeamResults';
import TeamSelector from './TeamSelector';
import Title from './Title';

export const GET_TEAM_RESULTS_QUERY = gql`
  query getTeamResults($year: Int!, $playerId: Int!) {
    tours(year: $year) {
      gamePlayers {
        id
        name
      }
    }
    overallResults(year: $year, playerId: $playerId) {
      points
      percentile
      riders {
        ordinal
        name
        points
      }
    }
  }
`

function Teams() {
  const [overallResult, setOverallResult] = useState(null);
  const [selectedTeamId, setSelectedTeamId] = useState(-1);
  const [teams, setTeams] = useState([]);

  const teamId = parseInt(useParams().teamId);

  const year = 2019;
  const { loading, error, data } = useQuery(
    GET_TEAM_RESULTS_QUERY,
    { variables: { year: year, playerId: teamId } }
  );

  function handleTeamSelection(teamId) {
    setSelectedTeamId(parseInt(teamId));
  }

  if (loading) return <div><p>Loading...</p></div>;
  if (error) return <div><strong>Error:</strong> {error.toString()}</div>;

  if (selectedTeamId === -1) {
    setSelectedTeamId(parseInt(teamId));
  }

  if (overallResult == null) {
    setOverallResult(data.overallResults[0]);
  }

  if (teams.length === 0) {
    data.tours[0].gamePlayers.sort((a, b) => a.name.localeCompare(b.name));
    setTeams(data.tours[0].gamePlayers);
  }

  let teamResults = <p>Team results go here</p>;
  if (overallResult != null) {
    teamResults = <TeamResults overallResult={overallResult}/>
    history.push(`/players/${year}/${selectedTeamId}`);
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
          {teamResults}
        </Row>
      </main>
    </>
  );
}

export default Teams
