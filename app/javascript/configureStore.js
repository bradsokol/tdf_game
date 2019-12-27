import { createStore } from "redux";

const initialState = {
  things: [
    {
      name: "Thing 1",
      guid: "c796e3ab-4268-4396-aa0f-db672888222b"
    },
    {
      name: "Thing 2",
      guid: "68aabd29-cfae-42f9-9146-9f7bbbc19eca"
    }
  ]
};

function rootReducer(state, action) {
  console.log(action.type);
  switch (action.type) {
    default:
      return state
  }
}

export default function configureStore() {
  const store = createStore(rootReducer, initialState);
  return store;
}
