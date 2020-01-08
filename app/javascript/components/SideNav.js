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
                <Nav.Link eventKey="Overall">Overall</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="Stages">Stages</Nav.Link>
              </Nav.Item>
              <Nav.Item>
                <Nav.Link eventKey="Teams">Teams</Nav.Link>
              </Nav.Item>
            </Nav>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default SideNav
