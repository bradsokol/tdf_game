import React from 'react';

import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import TeamResults from '../../../app/javascript/components/TeamResults';

describe('TeamResults', () => {
  it('shows the riders results', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

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
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(-2, -1)
    expect(row.find('td').at(2).text()).toBe('670');
  });

  it('shows the players overall percentile', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(-1)
    expect(row.find('td').at(2).text()).toBe('40');
  });

  it('shows stages', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(0);
    expect(row.find('th').at(3).text()).toBe('Stage 2');
    expect(row.find('th').at(4).text()).toBe('Stage 3');
  });

  it('shows rider points', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(1);
    expect(row.find('td').at(3).text()).toBe('23');
    expect(row.find('td').at(4).text()).toBe('45');
  });

  it('shows nothing if rider has zero points for a stage', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(2);
    expect(row.find('td').at(3).text()).toBe('');
  });

  it('indicates if the rider has abandoned', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(2);
    expect(row.find('td').at(4).text()).toBe('-');
  });

  it('shows the total stage points', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(3);
    expect(row.find('td').at(3).text()).toBe('2');
    expect(row.find('td').at(4).text()).toBe('4');
  });

  it('shows the stage percentile', () => {
    const wrapper = mount(<TeamResults overallResult={mockOverallResult} stages={mockStages}/>);

    const row = wrapper.find('tr').slice(4);
    expect(row.find('td').at(3).text()).toBe('3');
    expect(row.find('td').at(4).text()).toBe('5');
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

const mockStages = [
  {
    number: 1,
    gameStage: false,
    stageResults: [
      {
        points: 1,
        percentile: 2,
        riders: []
      }
    ]
  },
  {
    number: 2,
    gameStage: true,
    stageResults: [
      {
        points: 2,
        percentile: 3,
        riders: [
          { points: 23 },
          { points: 0 },
        ]
      }
    ]
  },
  {
    number: 3,
    gameStage: true,
    stageResults: [
      {
        points: 4,
        percentile: 5,
        riders: [
          { points: 45 },
          { points: null },
        ]
      }
    ]
  },
];
