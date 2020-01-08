import React from "react"

import { ApolloClient } from 'apollo-client';
import { ApolloProvider } from 'react-apollo';
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import PlayerList from './PlayerList';
import SideNav from './SideNav';
import Title from './Title';

class Dashboard extends React.Component {
  render () {
    return (
      <React.Fragment>
        <Title/>
        <SideNav/>
        <PlayerList/>
      </React.Fragment>
    );
  }
}

export default Dashboard
