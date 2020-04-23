import React from 'react';
import renderer from 'react-test-renderer';
import TestRenderer from 'react-test-renderer';
const {act} = TestRenderer;

import { MockedProvider } from '@apollo/react-testing';

import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import StageSelector from '../../../app/javascript/components/StageSelector';
import { GET_STAGES_QUERY } from '../../../app/javascript/components/StageSelector';

import Row from 'react-bootstrap/Row'

const wait = require('waait');

describe('StageSelector', () => {
  it.skip('renders game stages', async () => {
    await act(async () => {
      const component = renderer.create(
        <MockedProvider mocks={[stagesMock]} addTypename={false}>
          <StageSelector/>
        </MockedProvider>,
      );

      await wait(2);
      console.log(component.root); // .find(Row));
      expect(component.root.find(Row)).toHaveLength(1);
    });

  });

  it.skip('has links with the correct paths', () => {
    // const wrapper = mount(
    //   <MemoryRouter>
    //     <SideNav/>
    //   </MemoryRouter>
    // );

    // const linkPaths = ['/overall', '/stages', '/players'];
    // expect(wrapper.find(Link).map(link => link.props().to)).toStrictEqual(linkPaths);
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
              number: 1,
              date: '2019-07-06',
              startTown: 'Bruxelles',
              finishTown: 'Brussel',
              distance: 195,
              stageType: 'flat',
              gameStage: false,
            },
            {
              number: 2,
              date: '2019-07-07',
              startTown: 'Bruxelles Palais Royal',
              finishTown: 'Brussel Atomium',
              distance: 28,
              stageType: 'ttt',
              gameStage: false,
            },
            {
              number: 3,
              date: '2019-07-08',
              startTown: 'Binche',
              finishTown: 'Épernay',
              distance: 215,
              stageType: 'rolling',
              gameStage: true,
            },
          ],
        },
      ],
    },
  },
}
