import React from 'react';
import { configure, shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

import TeamSelector from '../../../app/javascript/components/TeamSelector';

configure({ adapter: new Adapter() });

describe('TeamSelector', () => {
  it('renders select button with teams', () => {
    const wrapper = shallow(
      <TeamSelector teams={players} selectedTeamId={0} />
    );

    const select = wrapper.find('select');
    expect(select.find('option').filterWhere((option) => {
        return option.prop('name') === 'team1';
    }).text()).toBe('Brad Sokol');
    expect(select.find('option').filterWhere((option) => {
        return option.prop('name') === 'team2';
    }).text()).toBe('Roger Partington');
    expect(select.find('option').filterWhere((option) => {
        return option.prop('name') === 'team3';
    }).text()).toBe('Brian Power');
  });

  it('selects the selected team', () => {
    const wrapper = shallow(
      <TeamSelector teams={players} selectedTeamId={1} />
    );

    expect(wrapper.find('select').filterWhere((select) => {
      return select.prop('value') === 1;
    })).toHaveLength(1);
  });

  it('lifts team index when team selected', () => {
    let actualTeamIndex = -1
    function handleTeamSelected(teamIndex) {
      actualTeamIndex = teamIndex;
    }

    const wrapper = shallow(
      <TeamSelector
        teams={players}
        onTeamSelected={handleTeamSelected}
      />
    );

    const select = wrapper.find('select');
    select.simulate("change", {
      target: { value: 1, selectedIndex: 1 }
    });

    expect(actualTeamIndex).toBe(1);
  });
});

const players = [
  { name: "Brad Sokol" },
  { name: "Roger Partington" },
  { name: "Brian Power" },
];
