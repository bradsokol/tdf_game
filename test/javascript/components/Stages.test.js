import React from 'react';
import { shallow } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import { configure } from 'enzyme';

import Title from '../../../app/javascript/components/Title';
import SideNav from '../../../app/javascript/components/SideNav';
import Stages from '../../../app/javascript/components/Stages';
import StageSelector from '../../../app/javascript/components/StageSelector';

configure({ adapter: new Adapter() });

describe('Stages', () => {
  it('renders a title', () => {
    const wrapper = shallow(<Stages/>);

    expect(wrapper.find(Title)).toHaveLength(1);
  });

  it('renders a side nav', () => {
    const wrapper = shallow(<Stages/>);

    expect(wrapper.find(SideNav)).toHaveLength(1);
  });

  it('renders a stage selector', () => {
    const wrapper = shallow(<Stages/>);

    expect(wrapper.find(StageSelector)).toHaveLength(1);
  });
});
