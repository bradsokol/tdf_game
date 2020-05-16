import React from 'react';

import { MemoryRouter } from 'react-router';
import { Link } from 'react-router-dom'
import Adapter from 'enzyme-adapter-react-16';
import {act} from 'react-dom/test-utils';
import { configure, mount } from 'enzyme';

import { MockedProvider } from '@apollo/react-testing';

configure({ adapter: new Adapter() });

import SideNav, { GET_STAGES_QUERY } from '../../../app/javascript/components/SideNav';

const waitForExpect = require('wait-for-expect');

configure({ adapter: new Adapter() });

describe('SideNav', () => {
  it('has links with the correct text', async () => {
    await act(async () => {
      const wrapper = mount(
        <MemoryRouter>
          <MockedProvider mocks={[stagesMock]} addTypename={false}>
            <SideNav/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
      });

      const linkText = ['Overall', 'Stages', 'Teams'];
      expect(wrapper.find(Link).map(link => link.text())).toStrictEqual(linkText);
    });
  });

  it('has links with the correct paths', async () => {
    await act(async () => {
      const wrapper = mount(
        <MemoryRouter>
          <MockedProvider mocks={[stagesMock]} addTypename={false}>
            <SideNav/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
      });

      const linkPaths = ['/overall/2019', '/stages/2019/3', '/players/2019/1'];
      expect(wrapper.find(Link).map(link => link.props().to)).toStrictEqual(linkPaths);
    });
  });
});

const stagesMock = {
  request: {
    query: GET_STAGES_QUERY,
    variables: {
      year: 2019,
    },
  },
  result: {
    data: {
      tours: [
        {
          stages: [
            {
              id: 1,
              number: 1,
              gameStage: false,
            },
            {
              id: 2,
              number: 2,
              gameStage: false,
            },
            {
              id: 3,
              number: 3,
              gameStage: true,
            },
            {
              id: 4,
              number: 4,
              gameStage: true,
            },
          ],
          gamePlayers: [
            {
              id: 1,
              name: "Brad Sokol"
            },
            {
              id: 3,
              name: "Roger Partington"
            },
            {
              id: 2,
              name: "Brian Power"
            },
          ],
        },
      ],
    },
  },
}
