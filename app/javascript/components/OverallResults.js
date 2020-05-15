import gql from 'graphql-tag';
import React from "react"
import { useQuery } from '@apollo/react-hooks';
import Table from "react-bootstrap/Table"

export const GET_OVERALL_RESULTS_QUERY = gql`
  query getOverallResults($year: Int!) {
    overallResults(year: $year) {
      date
      player {
        name
      }
      points
      gap
      overallRank
      previousRank
    }
  }
`

function OverallResults() {
  const year = 2019;
  const { loading, error, data } = useQuery(
    GET_OVERALL_RESULTS_QUERY,
    { variables: { year} },
  );

  if (loading) return <div><p>Loading...</p></div>;
  if (error) return <div><strong>Error:</strong> {error.toString()}</div>;

  const { overallResults } = data;
  overallResults.sort((a, b) => b.points - a.points);
  const leadingScore = overallResults[0].points;

  let poolRank = 1;
  let points = leadingScore;
  overallResults[0].poolRank = poolRank;
  overallResults.slice(1, overallResults.length).forEach(result => {
    poolRank += 1;
    if (result.points != points) {
      result.poolRank = poolRank;
      points = result.points;
    }
  });

  const date = new Date(Date.parse(overallResults[0].date + "T06:00:00Z"))
  const dateOptions = { month: 'long', day: 'numeric', year: 'numeric' }

  return (
    <>
      <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
        <h2>Overall Results</h2>
        <p>Results up to {date.toLocaleDateString(date, dateOptions)}</p>
        <div className="table-responsive">
          <Table striped className="table table-striped table-sm">
            <thead>
              <tr>
                <th/>
                <th className="text-left">Player</th>
                <th className="text-right">Points</th>
                <th className="text-right">Points Behind</th>
                <th className="text-right">Overall Rank</th>
                <th className="text-right">Previous Rank</th>
                <th className="text-right">Rank Change</th>
                <th className="text-right">Points Behind Overall</th>
              </tr>
            </thead>
            <tbody>
              {overallResults.map((result, index) => {
                return (
                  <tr key={index}>
                    <td className="text-right">{result.poolRank}</td>
                    <td>{result.player.name}</td>
                    <td className="text-right">{result.points}</td>
                    <td className="text-right">{leadingScore - result.points}</td>
                    <td className="text-right">{result.overallRank}</td>
                    <td className="text-right">{result.previousRank}</td>
                    <td className="text-right">{result.previousRank - result.overallRank}</td>
                    <td className="text-right">{result.gap}</td>
                  </tr>
                )
              })}
            </tbody>
          </Table>
        </div>
      </main>
    </>
  );
}

export default OverallResults
