import { createStore, applyMiddleware } from "redux";

import thunk from 'redux-thunk';

const initialState = {
  things: []
};

import rootReducer from "./reducers";

export default function configureStore() {
  const store = createStore(
    rootReducer,
    initialState,
    applyMiddleware(thunk)
  );
  return store;
}
