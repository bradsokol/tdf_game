import React from "react"

import 'bootstrap/dist/css/bootstrap.min.css';
import '../stylesheets/dashboard.css'

import OverallResults from './OverallResults';
import SideNav from './SideNav';
import Title from './Title';

function Dashboard() {
  return (
    <>
      <Title/>
      <SideNav/>
      <OverallResults/>
    </>
  );
}

export default Dashboard
