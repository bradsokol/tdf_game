import { ApolloClient } from 'apollo-client';
import { ApolloProvider } from 'react-apollo';
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';
import React from "react"

import Dashboard from './Dashboard';

const httpLink = new HttpLink({
  uri: 'http://localhost:3000/graphql',
});
const cache = new InMemoryCache();
const client = new ApolloClient({
  link: httpLink,
  cache,
});

class App extends React.Component {
  render () {
    return (
      <BrowserRouter>
        <ApolloProvider client={client}>
          <Switch>
            <Route exact path="/" render={() => <Dashboard/>} />
          </Switch>
        </ApolloProvider>
      </BrowserRouter>
    );
  }
}

export default App
