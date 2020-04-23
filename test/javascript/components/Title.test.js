import React from 'react';

import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import Title from '../../../app/javascript/components/Title';

describe('Title', () => {
  it('shows the app title', () => {
    const wrapper = mount(<Title/>);

    expect(wrapper.find('a').text()).toBe('Avondale Tour de France Pool');
  });
});
