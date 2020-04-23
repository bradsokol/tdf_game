import React from "react"

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import SideNav from './SideNav';
import Title from './Title';

class Dashboard extends React.Component {
  render () {
    return (
      <React.Fragment>
        <Title/>
        <SideNav/>
        <main role="main" className="col-md-9 ml-sm-auto col-lg-10 px-4">
          <h2>Team Results</h2>
        </main>
      </React.Fragment>
    );
  }
}

export default Dashboard
