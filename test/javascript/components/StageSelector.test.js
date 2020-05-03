import React from 'react';
import { configure, shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

import StageSelector from '../../../app/javascript/components/StageSelector';

configure({ adapter: new Adapter() });

describe('StageSelector', () => {
  it('renders select button with stages', () => {
    const wrapper = shallow(
      <StageSelector stages={stages} />
    );

    const select = wrapper.find('select');
    expect(select.find('option').filterWhere((option) => {
        return option.prop('name') === 'stage3';
    }).text()).toBe('Stage 3 - July 8 - Binche to Épernay - 215 km');
    expect(select.find('option').filterWhere((option) => {
        return option.prop('name') === 'stage4';
    }).text()).toBe('Stage 4 - July 9 - Reims to Nancy - 214 km');
  });
});

const stages= [
  {
    id: 3,
    number: 3,
    date: '2019-07-08',
    startTown: 'Binche',
    finishTown: 'Épernay',
    distance: 215,
    stageType: 'rolling',
    gameStage: true,
  },
  {
    id: 4,
    number: 4,
    date: '2019-07-09',
    startTown: 'Reims',
    finishTown: 'Nancy',
    distance: 214,
    stageType: 'rolling',
    gameStage: true,
  },
];
