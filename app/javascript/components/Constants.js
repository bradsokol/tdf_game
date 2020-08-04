const process = require('process');

const development = {
  api_url: 'http://localhost:5000/graphql'
};

const production = {
  api_url: 'https://gentle-wildwood-88781.herokuapp.com/graphql'
};

export const config = process.env.NODE_ENV === 'production' ? production : development;
