import React from "react"
import PropTypes from "prop-types"

import gql from 'graphql-tag';
import Table from "react-bootstrap/Table"
import { useQuery } from '@apollo/react-hooks';

export const GET_STAGE_RESULTS_QUERY = gql`
  query getStageResults($date: ISO8601Date!) {
    stageResults(date: $date) {
      id
      player {
        name
      }
      points
      overallRank
    }
  }
`

function StageResults(props) {
  const stage = props.stage;
  const { loading, error, data } = useQuery(
    GET_STAGE_RESULTS_QUERY,
    { variables: { date: stage.date } }
  );

  if (loading) return <div><p>Loading...</p></div>;
  if (error) return <div><strong>Error:</strong> {error.toString()}</div>;

  const { stageResults } = data;
  if (stageResults.length == 0) {
    return <div><p>Results not available.</p></div>;
  }

  stageResults.sort((a, b) => b.points - a.points);
  let winnerPoints = stageResults[0].points;

  let poolRank = 1;
  let points = winnerPoints;
  stageResults[0].poolRank = poolRank;
  stageResults.slice(1, stageResults.length).forEach(stageResult => {
    poolRank += 1;
    if (stageResult.points != points) {
      stageResult.poolRank = poolRank;
      points = stageResult.points;
    }
  });

  return (
    <div className="table-responsive">
      <Table striped className="table table-striped table-sm">
        <thead>
          <tr>
            <th/>
            <th className="text-left">Player</th>
            <th className="text-right">Points</th>
            <th className="text-right">Pool Behind</th>
            <th className="text-right">Overall Rank</th>
          </tr>
        </thead>
        <tbody>
          {stageResults.map((result, index) => {
            return (
              <tr key={index}>
                <td className="text-right">{result.poolRank}</td>
                <td className="text-left">{result.player.name}</td>
                <td className="text-right">{result.points}</td>
                <td className="text-right">{winnerPoints - result.points}</td>
                <td className="text-right">{result.overallRank}</td>
              </tr>
            )
          })}
        </tbody>
      </Table>
    </div>
  );
}

StageResults.propTypes = {
  stage: PropTypes.object,
};

export default StageResults
