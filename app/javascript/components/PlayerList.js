import gql from 'graphql-tag';
import PropTypes from "prop-types"
import React from "react"
import { Query } from 'react-apollo';
import Table from "react-bootstrap/Table"

const GET_PLAYERS = gql`
  {
    tours(year: 2019) {
      gamePlayers {
        name
      }
    }
  }
`
class PlayerList extends React.Component {
  render () {
    return (
      <React.Fragment>
        <Query query={GET_PLAYERS}>
          {({ data, loading, error }) => {

            if (error) {
              return <div><strong>Error:</strong> {error.toString()}</div>
            }

            if (loading || !data) {
              return <div>Loading...</div>
            }

            const { tours } = data;
            const players = tours[0].gamePlayers;
            return (
              <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
                <h2>Overall Results</h2>
                <div className="table-responsive">
                  <Table striped className="table table-striped table-sm">
                    <thead>
                      <tr><td/><td>Player</td></tr>
                    </thead>
                    <tbody>
                      {players.map((player, index) => {
                        return (
                          <tr key={index}>
                            <td className="text-right">{index + 1}</td>
                            <td>{player.name}</td>
                          </tr>
                        )
                      })}
                    </tbody>
                  </Table>
                </div>
              </main>
            );
          }}
        </Query>
      </React.Fragment>
    );
  }
}

export default PlayerList
