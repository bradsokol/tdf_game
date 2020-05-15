import React from 'react';
import Adapter from 'enzyme-adapter-react-16';
import { configure, shallow } from 'enzyme';

import Overall from '../../../app/javascript/components/Overall';

configure({ adapter: new Adapter() });

describe('Stages', () => {
  it('renders the title', () => {
    const wrapper = shallow(
      <Overall/>
    );

    expect(wrapper.find('Title')).toHaveLength(1);
  });

  it('renders the side nav', () => {
    const wrapper = shallow(
      <Overall/>
    );

    expect(wrapper.find('SideNav')).toHaveLength(1);
  });

  it('renders the overall results', () => {
    const wrapper = shallow(
      <Overall/>
    );

    expect(wrapper.find('OverallResults')).toHaveLength(1);
  });
});
