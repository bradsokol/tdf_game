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
                <Nav.Link eventKey="Overall"><Link to='/overall'>Overall</Link></Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="Stages"><Link to='/stages'>Stages</Link></Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="Teams"><Link to='/players'>Teams</Link></Nav.Link>
              </Nav.Item>
            </Nav>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default SideNav
