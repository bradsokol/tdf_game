import React from "react"
import PropTypes from "prop-types"

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
