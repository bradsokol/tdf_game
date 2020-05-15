import React from 'react';
import { mount } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import { configure } from 'enzyme';
import {act} from 'react-dom/test-utils';

import { MockedProvider } from '@apollo/react-testing';

import OverallResults from '../../../app/javascript/components/OverallResults';
import { GET_OVERALL_RESULTS_QUERY } from '../../../app/javascript/components/OverallResults';

const waitForExpect = require('wait-for-expect');

configure({ adapter: new Adapter() });

describe('OverallResults', () => {
  it('renders a message when loading', async () => {
    await act(async () => {
      const wrapper = mount(
        <MockedProvider mocks={[]}>
          <OverallResults/>
        </MockedProvider>
      );

      expect(wrapper.text()).toMatch('Loading...');
    });
  });

  it('renders a message on error', async () => {
    await act(async () => {
      const errorMock = {
        request: {
          query: GET_OVERALL_RESULTS_QUERY,
          variables: {
            year: 2019,
          },
        },
        error: new Error('Boom!'),
      };

      const wrapper = mount(
        <MockedProvider mocks={[errorMock]} addTypename={false}>
          <OverallResults/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.text()).toMatch('Boom!');
      });
    });
  });

  it('renders stage results', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_OVERALL_RESULTS_QUERY,
          variables: {
            year: 2019,
          },
        },
        result: {
          data: mockOverallResults,
        },
      };

      const wrapper = mount(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <OverallResults/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('tr')).toHaveLength(mockOverallResults.overallResults.length + 1);
      });
    });
  });

  it('renders the results date', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_OVERALL_RESULTS_QUERY,
          variables: {
            year: 2019,
          },
        },
        result: {
          data: mockOverallResults,
        },
      };

      const wrapper = mount(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <OverallResults/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        expect(wrapper.find('p').text()).toMatch('Results up to July 28, 2019');
      });
    });
  });

  it('computes the pool standings', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_OVERALL_RESULTS_QUERY,
          variables: {
            year: 2019,
          },
        },
        result: {
          data: mockOverallResults,
        },
      };

      const wrapper = mount(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <OverallResults/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        const rows = wrapper.find('tr').slice(1);
        expect(rows.at(0).find('td').at(0).text()).toBe('1');
        expect(rows.at(1).find('td').at(0).text()).toBe('');
        expect(rows.at(2).find('td').at(0).text()).toBe('3');
      });
    });
  });

  it('computes the pool points behind', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_OVERALL_RESULTS_QUERY,
          variables: {
            year: 2019,
          },
        },
        result: {
          data: mockOverallResults,
        },
      };

      const wrapper = mount(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <OverallResults/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        const rows = wrapper.find('tr').slice(1);
        expect(rows.at(0).find('td').at(3).text()).toBe('0');
        expect(rows.at(1).find('td').at(3).text()).toBe('0');
        expect(rows.at(2).find('td').at(3).text()).toBe('136');
      });
    });
  });

  it('computes the rank change', async () => {
    await act(async () => {
      const graphQLMock = {
        request: {
          query: GET_OVERALL_RESULTS_QUERY,
          variables: {
            year: 2019,
          },
        },
        result: {
          data: mockOverallResults,
        },
      };

      const wrapper = mount(
        <MockedProvider mocks={[graphQLMock]} addTypename={false}>
          <OverallResults/>
        </MockedProvider>,
      );

      await waitForExpect(() => {
        wrapper.update();
        const rows = wrapper.find('tr').slice(1);
        expect(rows.at(0).find('td').at(6).text()).toBe('-8');
        expect(rows.at(1).find('td').at(6).text()).toBe('4');
        expect(rows.at(2).find('td').at(6).text()).toBe('-14');
      });
    });
  });
});

const mockOverallResults = {
  overallResults: [
    {
      date: "2019-07-28",
      player: {
        name: "G. Graveldog"
      },
      points: 670,
      gap: -84,
      overallRank: 39,
      previousRank: 31
    },
    {
      date: "2019-07-28",
      player: {
        name: "Coco Colombiano"
      },
      points: 670,
      gap: -84,
      overallRank: 39,
      previousRank: 43
    },
    {
      date: "2019-07-28",
      player: {
        name: "Kevin Blick"
      },
      points: 534,
      gap: -220,
      overallRank: 243,
      previousRank: 229
    },
  ]
};
