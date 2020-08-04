import React from 'react';
import { ApolloClient } from 'apollo-client';
import { ApolloProvider } from 'react-apollo';
import { BrowserRouter } from 'react-router-dom'
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

import { config } from './Constants';
import Routes from './Routes';

const httpLink = new HttpLink({
  uri: config.api_url,
});
const cache = new InMemoryCache();
const client = new ApolloClient({
  link: httpLink,
  cache,
});

function App() {
  return (
    <BrowserRouter>
      <ApolloProvider client={client}>
        <Routes/>
      </ApolloProvider>
    </BrowserRouter>
  );
}

export default App
