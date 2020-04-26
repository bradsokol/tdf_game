import React from 'react';
import renderer from 'react-test-renderer';
import TestRenderer from 'react-test-renderer';
const {act} = TestRenderer;

import { MockedProvider } from '@apollo/react-testing';

import StageSelector from '../../../app/javascript/components/StageSelector';
import { GET_STAGES_QUERY } from '../../../app/javascript/components/StageSelector';

const wait = require('waait');

describe('StageSelector', () => {
  it('renders a message when loading', async () => {
    await act(async () => {
      const component = renderer.create(
        <MockedProvider mocks={[]}>
          <StageSelector/>
        </MockedProvider>
      );

      await component.toJSON();
      expect(component.root.findByType('p').children.join('')).toContain('Loading...');
    });
  });

  it('renders select button with stages', async () => {
    await act(async () => {
      const component = renderer.create(
        <MockedProvider mocks={[stagesMock]} addTypename={false}>
          <StageSelector/>
        </MockedProvider>,
      );

      await wait(20);

      const select = component.root.find((element) => element.type == 'select' && element.props.name == 'stages');
      var option = select.find((element) => element.type == 'option' && element.props.name == 'stage3');
      expect(option.children.join('')).toBe('Stage 3 - July 8 - Binche to Épernay - 215 km');

      option = select.find((element) => element.type == 'option' && element.props.name == 'stage4');
      expect(option.children.join('')).toBe('Stage 4 - July 9 - Reims to Nancy - 214 km');
    });
  });

  it('does not render non-game-stages', async () => {
    await act(async () => {
      const component = renderer.create(
        <MockedProvider mocks={[stagesMock]} addTypename={false}>
          <StageSelector/>
        </MockedProvider>,
      );

      await wait(20);

      const select = component.root.find((element) => element.type == 'select' && element.props.name == 'stages');
      const options = select.findAll((element) => element.type == 'option');
      expect(options).toHaveLength(2);

      var option = select.findAll((element) => element.type == 'option' && element.props.name == 'stage1');
      expect(option).toHaveLength(0);
      option = select.findAll((element) => element.type == 'option' && element.props.name == 'stage2');
      expect(option).toHaveLength(0);
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
      const component = renderer.create(
        <MockedProvider mocks={[errorMock]} addTypename={false}>
          <StageSelector/>
        </MockedProvider>,
      );

      await wait(100);

      const tree = component.toJSON();
      expect(tree.children.join('')).toContain('Boom!');
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
