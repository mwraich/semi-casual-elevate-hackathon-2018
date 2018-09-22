import React, { Component } from 'react';
import HomePage from './home_page/HomePage.js'
import NavBar from './navbar/NarBar'
import '../node_modules/bootstrap/dist/css/bootstrap.css'
import '../node_modules/bootstrap/dist/js/bootstrap.bundle.js'
import './app.css'



class App extends Component {


  render() {
    return (
      <div >
        <NavBar />
        <HomePage />
      </div>
    )
  }
}

export default App;
