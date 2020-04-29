import React from 'react';
import renderer from 'react-test-renderer';
import TestRenderer from 'react-test-renderer';
const {act} = TestRenderer;

import { MockedProvider } from '@apollo/react-testing';

import StageResults from '../../../app/javascript/components/StageResults';
import { GET_STAGE_RESULTS_QUERY } from '../../../app/javascript/components/StageResults';

const wait = require('waait');

describe('StageResults', () => {
  it('renders a message when loading', async () => {
    await act(async () => {
      const component = renderer.create(
        <MockedProvider mocks={[]}>
          <StageResults stage={mockStage}/>
        </MockedProvider>
      );

      await component.toJSON();
      expect(component.root.findByType('p').children.join('')).toContain('Loading...');
    });
  });

  it('renders a message if there are no stage results', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_STAGE_RESULTS_QUERY,
          variables: {
            date: mockStage.date,
          },
        },
        result: {
          data: {
            stageResults: [],
          }
        },
      };

      const component = renderer.create(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <StageResults stage={mockStage}/>
        </MockedProvider>,
      );

      await wait(100);

      expect(component.root.findByType('p').children.join('')).toContain('Results not available.');
    });
  });

  it('renders stage results', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_STAGE_RESULTS_QUERY,
          variables: {
            date: mockStage.date,
          },
        },
        result: {
          data: mockStageResults,
        },
      };

      const component = renderer.create(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <StageResults stage={mockStage}/>
        </MockedProvider>,
      );

      await wait(100);

      expect(component.root.findAllByType('tr')).toHaveLength(mockStageResults.stageResults.length + 1);
    });
  });

  it('renders a message on error', async () => {
    await act(async () => {
      const errorMock = {
        request: {
          query: GET_STAGE_RESULTS_QUERY,
          variables: {
            date: mockStage.date,
          },
        },
        error: new Error('Boom!'),
      };

      const component = renderer.create(
        <MockedProvider mocks={[errorMock]} addTypename={false}>
          <StageResults stage={mockStage}/>
        </MockedProvider>,
      );

      await wait(100);

      const tree = component.toJSON();
      expect(tree.children.join('')).toContain('Boom!');
    });
  });
});

const mockStage = {
  id: 4,
  number: 4,
  date: '2019-07-09',
  startTown: 'Reims',
  finishTown: 'Nancy',
  distance: 214,
  stageType: 'rolling',
  gameStage: true,
};

const mockStageResults = {
  stageResults: [
    {
      id: 630,
      player: {
        name: "Brad Sokol"
      },
      points: 75,
      overallRank: 22
    },
    {
      id: 631,
      player: {
        name: "Roger Partington"
      },
      points: 51,
      overallRank: 133
    },
    {
      id: 632,
      player: {
        name: "Brian Power"
      },
      points: 52,
      overallRank: 123
    },
  ]
};
