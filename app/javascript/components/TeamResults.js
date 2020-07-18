import React from "react"
import PropTypes from "prop-types"

import Table from "react-bootstrap/Table"

function TeamResults(props) {
  const overallResult = props.overallResult;
  const stages = props.stages.filter(stage => stage.gameStage);

  function formatPoints(points) {
    if (points == null) {
      return '-';
    } else if (points === 0) {
      return '';
    } else {
      return points;
    }
  }

  return (
    <div className="table-responsive">
      <Table striped className="table table-striped table-sm">
        <thead>
          <tr>
            <th/>
            <th className="text-left">Rider</th>
            <th className="text-right">Total Points</th>
            {stages.map((stage, index) => {
              return (
                <th className="text-right" key={index}>
                  <a href={`/stages/2019/${stage.number}`}>Stage {stage.number}</a>
                </th>
              )
            })}
          </tr>
        </thead>
        <tbody>
          {overallResult.riders.map((rider, riderIndex) => {
            return (
              <tr key={riderIndex}>
                <td className="text-right">{rider.ordinal}</td>
                <td className="text-left">{rider.name}</td>
                <td className="text-right">{rider.points}</td>
                {stages.map((stage, stageIndex) => {
                  return (
                    <td className="text-right" key={stageIndex}>{formatPoints(stage.stageResults[0].riders[riderIndex].points)}</td>
                  )
                })}
              </tr>
            )
          })}
          <tr key="16">
            <td/>
            <td className="text-left"><strong>Total</strong></td>
            <td className="text-right"><strong>{overallResult.points}</strong></td>
            {stages.map((stage, stageIndex) => {
              return (
                <td className="text-right" key={stageIndex}><strong>{stage.stageResults[0].points}</strong></td>
              )
            })}
          </tr>
          <tr key="17">
            <td/>
            <td className="text-left"><strong>Percentile</strong></td>
            <td className="text-right"><strong>{overallResult.percentile}</strong></td>
            {stages.map((stage, stageIndex) => {
              return (
                <td className="text-right" key={stageIndex}><strong>{stage.stageResults[0].percentile}</strong></td>
              )
            })}
          </tr>
        </tbody>
      </Table>
    </div>
  );
}

TeamResults.propTypes = {
  overallResult: PropTypes.object,
  stages: PropTypes.array,
};

export default TeamResults;
