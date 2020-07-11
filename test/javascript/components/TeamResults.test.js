import React from 'react';

import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import TeamResults from '../../../app/javascript/components/TeamResults';

describe('TeamResults', () => {
  it('shows the riders results', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult}/>);

    let row = wrapper.find('tr').slice(1);
    expect(row.find('td').at(0).text()).toBe('1');
    expect(row.find('td').at(1).text()).toBe('Rider 1');
    expect(row.find('td').at(2).text()).toBe('11');

    row = wrapper.find('tr').slice(2);
    expect(row.find('td').at(0).text()).toBe('2');
    expect(row.find('td').at(1).text()).toBe('Rider 2');
    expect(row.find('td').at(2).text()).toBe('22');
  });

  it('shows the players overall total', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult}/>);

    const row = wrapper.find('tr').slice(-2, -1)
    expect(row.find('td').at(2).text()).toBe('670');
  });

  it('shows the players overall percentile', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult}/>);

    const row = wrapper.find('tr').slice(-1)
    expect(row.find('td').at(2).text()).toBe('40');
  });
});

const mockOverallResult = {
  date: "2019-07-28",
  player: {
    name: "G. Graveldog"
  },
  points: 670,
  percentile: 40,
  gap: -84,
  overallRank: 39,
  previousRank: 31,
  riders: [
    { ordinal: 1, name: 'Rider 1', points: 11 },
    { ordinal: 2, name: 'Rider 2', points: 22 },
  ],
};
