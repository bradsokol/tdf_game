import React from "react"
import PropTypes from "prop-types"

function TeamSelector(props) {
  function onTeamSelected(event) {
    const teamId = event.target.value;
    props.onTeamSelected(teamId);
  }

  return (
    <select value={props.selectedTeamId} name="teams" onChange={onTeamSelected}>
      {props.teams.map((team, index) => {
        return(
          <option name={`team${index + 1}`} key={index} value={team.id}>{team.name}</option>
        );
      })}
    </select>
  );
}

TeamSelector.propTypes = {
  teams: PropTypes.arrayOf(PropTypes.object),
  selectedTeamId: PropTypes.number,
  onTeamSelected: PropTypes.func,
};

export default TeamSelector
