import gql from 'graphql-tag';
import PropTypes from "prop-types"
import React from "react"

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

function StageSelector(props) {
  function onStageSelected(event) {
    const index = event.target.value;
    props.onStageSelected(index);
  }

  function stageDescription(stage) {
    const date = new Date(Date.parse(stage.date + "T06:00:00Z"))
    const options = { month: 'long', day: 'numeric' }
    return `Stage ${stage.number} - ${date.toLocaleDateString(date, options)} - ` +
      `${stage.startTown} to ${stage.finishTown} - ${stage.distance} km`
  }

  return (
    <select name="stages" onChange={onStageSelected}>
      {props.stages.map((stage, index) => {
        return(
          <option name={`stage${stage.number}`} key={index} value={index}>{stageDescription(stage)}</option>
        )
      })}
    </select>
  );
}

StageSelector.propTypes = {
  stages: PropTypes.arrayOf(PropTypes.object),
  onStageSelected: PropTypes.func,
};

export default StageSelector
