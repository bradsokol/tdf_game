import Nav from "react-bootstrap/Nav"
import PropTypes from "prop-types"
import React from "react"

import { ApolloClient } from 'apollo-client';
import { ApolloProvider } from 'react-apollo';
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import PlayerList from './PlayerList';

const httpLink = new HttpLink({
  uri: 'http://localhost:3000/graphql',
});
const cache = new InMemoryCache();
const client = new ApolloClient({
  link: httpLink,
  cache,
});

class Dashboard extends React.Component {
  render () {
    return (
      <ApolloProvider client={client}>
        <React.Fragment>
          <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
            <a className="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Avondale Tour de France Pool</a>
          </nav>

          <div className="container-fluid">
            <div className="row">
              <Nav activekey="Overall" className="flex-column col-md-2 d-done d-md-block bg-light sidebar">
                <Nav.Item>
                  <Nav.Link eventKey="Overall">Overall</Nav.Link>
                </Nav.Item>
                <Nav.Item>
                  <Nav.Link eventKey="Stages">Stages</Nav.Link>
                </Nav.Item>
                <Nav.Item>
                  <Nav.Link eventKey="Teams">Teams</Nav.Link>
                </Nav.Item>
              </Nav>
            </div>
          </div>

          <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
            <PlayerList/>
          </main>
        </React.Fragment>
      </ApolloProvider>
    );
  }
}

export default Dashboard
