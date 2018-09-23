import React, { Component } from 'react';
import dad from './dad.jpg'
import './home_page.css';
import search from './search.svg'
import AutoSuggestionSearch from './AutoSuggestionSearch.js'

const dadPic = {
    title: 'Picture of dad and son reading a book',
    url: dad,
}

export default class HomePage extends Component {
    state = {
        query: '',
        location: '',
    }

    handleChange = (event) => {
        this.setState({ [event.target.name]: event.target.value });
    }

    handleLocationChange = data => {
        this.setState({ location: data })
    }

    handleSubmit = () => {
        const { query, location } = this.state
        this.props.submitSearch({query, location})
    }

    render() {
        return (
            <div className="home-page">
                <div className="card-container-h">
                    <h5>I know what I'm looking for</h5>
                    <div className="card" style={{width: '18rem'}}>
                        <img className="card-img-top" src={`${search}`} height="142" style={{padding: '2em'}} alt={dadPic.title}/>
                        <div className="card-body" style={{textAlign: 'left'}} >
                            <h6 className="text-left margin16">Program Search</h6>
                            <input
                                name="query"
                                className="input margin16"
                                placeholder="Find a program"
                                onChange={this.handleChange}
                            ></input>
                            <br />
                            <h6 className="text-left margin16">Which locations(s)?</h6>
                            <AutoSuggestionSearch handleLocationChange={this.handleLocationChange} />
                            <br />
                            <div style={{textAlign: 'center'}} >
                                <button
                                    type="button"
                                    className="btn btn-primary"
                                    onClick={this.handleSubmit}
                                    >Search</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="card-container-h" onClick={this.props.showStory} >
                    <h5>Help me find programs</h5>
                    <div className="card" style={{width: '18rem'}}>
                        <img className="card-img-top" src={`${dadPic.url}`} alt={dadPic.title}/>
                        <div className="card-body">
                            <p className="card-text">
                                Take 30 seconds to answer a few questions,we'll help find programs based on your answers
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}