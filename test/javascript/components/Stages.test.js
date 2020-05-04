import React from 'react';
import { mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import { configure } from 'enzyme';
import {act} from 'react-dom/test-utils';
import { BrowserRouter } from 'react-router-dom'

import { MockedProvider } from '@apollo/react-testing';

import Stages from '../../../app/javascript/components/Stages';
import { GET_STAGES_QUERY } from '../../../app/javascript/components/StageSelector';

const waitForExpect = require('wait-for-expect');

configure({ adapter: new Adapter() });

describe('Stages', () => {
  it('renders a message when loading', async () => {
    await act(async () => {
      const wrapper = mount(
        <MockedProvider mocks={[]}>
          <Stages/>
        </MockedProvider>
      );

      expect(wrapper.text()).toMatch('Loading...');
    });
  });

  it('renders a message on error', async () => {
    await act(async () => {
      const errorMock = {
        request: {
          query: GET_STAGES_QUERY,
          variables: {
            year: 2019,
          },
        },
        error: new Error('Boom!'),
      };

      const wrapper = mount(
        <MockedProvider mocks={[errorMock]} addTypename={false}>
          <Stages/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.text()).toMatch('Boom!');
      });
    });
  });

  it('renders a title', async () => {
    await act(async () => {
      const wrapper = mount(
        <BrowserRouter>
          <MockedProvider mocks={[stagesMock]} addTypename={false}>
            <Stages/>
          </MockedProvider>,
        </BrowserRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('Title')).toHaveLength(1);
      });
    });
  });

  it('renders a side nav', async () => {
    await act(async () => {
      const wrapper = mount(
        <BrowserRouter>
          <MockedProvider mocks={[stagesMock]} addTypename={false}>
            <Stages/>
          </MockedProvider>,
        </BrowserRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('SideNav')).toHaveLength(1);
      });
    });
  });

  it('renders a stage selector', async () => {
    await act(async () => {
      const wrapper = mount(
        <BrowserRouter>
          <MockedProvider mocks={[stagesMock]} addTypename={false}>
            <Stages/>
          </MockedProvider>,
        </BrowserRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('StageSelector')).toHaveLength(1);
      });
    });
  });

  it('renders stage results', async () => {
    await act(async () => {
      const wrapper = mount(
        <BrowserRouter>
          <MockedProvider mocks={[stagesMock]} addTypename={false}>
            <Stages/>
          </MockedProvider>,
        </BrowserRouter>
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('Row').at(1).find('StageResults')).toHaveLength(1);
      });
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
              date: '2019-07-06',
              startTown: 'Bruxelles',
              finishTown: 'Brussel',
              distance: 195,
              stageType: 'flat',
              gameStage: false,
            },
            {
              id: 2,
              number: 2,
              date: '2019-07-07',
              startTown: 'Bruxelles Palais Royal',
              finishTown: 'Brussel Atomium',
              distance: 28,
              stageType: 'ttt',
              gameStage: false,
            },
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
          ],
        },
      ],
    },
  },
}
