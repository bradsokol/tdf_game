import React from "react"
import PropTypes from "prop-types"

import Table from "react-bootstrap/Table"

function TeamResults(props) {
  const overallResult = props.overallResult;

  return (
    <div className="table-responsive">
      <Table striped className="table table-striped table-sm">
        <thead>
          <tr>
            <th/>
            <th className="text-left">Rider</th>
            <th className="text-right">Total Points</th>
          </tr>
        </thead>
        <tbody>
          {overallResult.riders.map((rider, index) => {
            return (
              <tr key={index}>
                <td className="text-right">{rider.ordinal}</td>
                <td className="text-left">{rider.name}</td>
                <td className="text-right">{rider.points}</td>
              </tr>
            )
          })}
          <tr key="16">
            <td/>
            <td className="text-left"><strong>Total</strong></td>
            <td className="text-right"><strong>{overallResult.points}</strong></td>
          </tr>
          <tr key="17">
            <td/>
            <td className="text-left"><strong>Percentile</strong></td>
            <td className="text-right"><strong>{overallResult.percentile}</strong></td>
          </tr>
        </tbody>
      </Table>
    </div>
  );
}

TeamResults.propTypes = {
  overallResult: PropTypes.object,
};

export default TeamResults;
