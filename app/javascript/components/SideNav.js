import { Link } from 'react-router-dom'
import Nav from "react-bootstrap/Nav"
import React from "react"

class SideNav extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className="container-fluid">
          <div className="row">
            <Nav activekey="Overall" className="flex-column col-md-2 d-done d-md-block bg-light sidebar">
              <Nav.Item>
                <Link className="nav-link" to='/overall/2019'>Overall</Link>
              </Nav.Item>
              <Nav.Item>
                <Link className="nav-link" to='/stages/2019/3'>Stages</Link>
              </Nav.Item>
              <Nav.Item>
                <Link className="nav-link" to='/players/2019'>Teams</Link>
              </Nav.Item>
            </Nav>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default SideNav
