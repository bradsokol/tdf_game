import React from "react"

import { ApolloClient } from 'apollo-client';
import { ApolloProvider } from 'react-apollo';
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import PlayerList from './PlayerList';
import SideNav from './SideNav';

class Dashboard extends React.Component {
  render () {
    return (
      <React.Fragment>
        <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
          <a className="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Avondale Tour de France Pool</a>
        </nav>

        <div className="container-fluid">
          <div className="row">
            <SideNav/>
          </div>
        </div>

        <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
          <PlayerList/>
        </main>
      </React.Fragment>
    );
  }
}

export default Dashboard
