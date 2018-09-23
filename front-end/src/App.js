import React, { Component } from 'react';
import HomePage from './home_page/HomePage.js'
import NavBar from './navbar/NavBar.js'
import StorySlider from './story_slider/StorySlider.js'
import '../node_modules/bootstrap/dist/css/bootstrap.css'
import '../node_modules/bootstrap/dist/js/bootstrap.bundle.js'
import './app.css'
import ResultsPage from "./results_page/ResultsPage"


class PageRouter extends Component {
  state = {
    data: null,
    page: "HomePage"
  }

  submitSearch = async ({query, location}) => {
    console.log(query, location)
    const data = await fetch(`http://localhost:3030/programs?q=${query}&location=${location}`, { mode: 'cors'})
      .then(data => data.json())
    console.log(data)

    this.setState({
      page: "ResultsPage",
      data
    })
  }

  render() {
    switch (this.state.page) {
      case "HomePage":
        return <HomePage submitSearch={this.submitSearch} />

      case "ResultsPage":
        return <ResultsPage data={this.state.data} />
    }
  }
}

class App extends Component {
  render() {
    return (
      <div >
        <NavBar />
        <PageRouter />
        {/* <StorySlider /> */}
      </div>
    )
  }
}

export default App;
