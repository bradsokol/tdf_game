import React from 'react';

import { MemoryRouter } from 'react-router';
import { Link } from 'react-router-dom'

import { configure, mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import SideNav from '../../../app/javascript/components/SideNav';

describe('SideNav', () => {
  it('has links with the correct text', () => {
    const wrapper = mount(
      <MemoryRouter>
        <SideNav/>
      </MemoryRouter>
    );

    const linkText = ['Overall', 'Stages', 'Teams'];
    expect(wrapper.find(Link).map(link => link.text())).toStrictEqual(linkText);
  });

  it('has links with the correct paths', () => {
    const wrapper = mount(
      <MemoryRouter>
        <SideNav/>
      </MemoryRouter>
    );

    const linkPaths = ['/overall', '/stages', '/players'];
    expect(wrapper.find(Link).map(link => link.props().to)).toStrictEqual(linkPaths);
  });
});
