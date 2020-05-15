import React from "react"
import PropTypes from "prop-types"

function TeamSelector(props) {
  function onTeamSelected(event) {
    const team_id = event.target.value;
    props.onTeamSelected(team_id);
  }

  return (
    <select value={props.selectedTeamIndex} name="teams" onChange={onTeamSelected}>
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
  selectedTeamIndex: PropTypes.number,
  onTeamSelected: PropTypes.func,
};

export default TeamSelector
