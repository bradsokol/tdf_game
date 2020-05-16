import React from 'react';
import { mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import { configure } from 'enzyme';
import {act} from 'react-dom/test-utils';
import { MemoryRouter } from 'react-router-dom'

import { MockedProvider } from '@apollo/react-testing';

import Teams, { GET_TEAMS_QUERY } from '../../../app/javascript/components/Teams';

const waitForExpect = require('wait-for-expect');

configure({ adapter: new Adapter() });

describe('Teams', () => {
  it('renders a message when loading', async () => {
    await act(async () => {
      const wrapper = mount(
        <MemoryRouter initialEntries={["/players/2019/1"]}>
          <MockedProvider mocks={[]}>
            <Teams/>
          </MockedProvider>
        </MemoryRouter>
      );

      expect(wrapper.text()).toMatch('Loading...');
    });
  });

  it('renders a message on error', async () => {
    await act(async () => {
      const errorMock = {
        request: {
          query: GET_TEAMS_QUERY,
          variables: {
            year: 2019,
          },
        },
        error: new Error('Boom!'),
      };

      const wrapper = mount(
        <MemoryRouter initialEntries={["/players/2019/1"]}>
          <MockedProvider mocks={[errorMock]} addTypename={false}>
            <Teams/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.text()).toMatch('Boom!');
      });
    });
  });

  it.skip('renders a title', async () => {
    // Skipping because I don't know how to mock the URL
    await act(async () => {
      const wrapper = mount(
        <MemoryRouter initialEntries={["/players/2019/3"]}>
          <MockedProvider mocks={[teamsMock]} addTypename={false}>
            <Teams/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('Title')).toHaveLength(1);
      });
    });
  });

  it.skip('renders a side nav', async () => {
    // Skipping because I don't know how to mock the URL
    await act(async () => {
      const wrapper = mount(
        <MemoryRouter initialEntries={["/stages/2019/3"]}>
          <MockedProvider mocks={[teamsMock]} addTypename={false}>
            <Teams/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('SideNav')).toHaveLength(1);
      });
    });
  });

  it.skip('renders a stage selector', async () => {
    // Skipping because I don't know how to mock the URL
    await act(async () => {
      const wrapper = mount(
        <MemoryRouter initialEntries={["/stages/2019/3"]}>
          <MockedProvider mocks={[teamsMock]} addTypename={false}>
            <Teams/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('StageSelector')).toHaveLength(1);
      });
    });
  });

  it.skip('renders stage results', async () => {
    // Skipping because this mocking isn't working
    jest.mock('react-router-dom', () => ({
      ...jest.requireActual('react-router-dom'),
      useParams: () => ({
        stageNumber: '3',
      }),
    }));

    await act(async () => {
      const wrapper = mount(
        <MemoryRouter initialEntries={["/stages/2019/3"]}>
          <MockedProvider mocks={[teamsMock]} addTypename={false}>
            <Teams/>
          </MockedProvider>,
        </MemoryRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('Row').at(1).find('StageResults')).toHaveLength(1);
      });
    });
  });
});

const teamsMock = {
  request: {
    query: GET_TEAMS_QUERY,
    variables: {
      year: 2019,
    },
  },
  result: {
    data: {
      tours: [
        {
          gamePlayers: [
            {
              id: 1,
              name: "Brad Sokol"
            },
            {
              id: 2,
              name: "Roger Partington"
            },
            {
              id: 3,
              name: "Brian Power"
            },
          ],
        },
      ],
    },
  },
}
