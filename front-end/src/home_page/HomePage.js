import React, { Component } from 'react';
import dad from './dad.jpg'
import './home_page.css';


const dadPic = {
    title: 'Picture of dad and son reading a book',
    url: dad,
}

export default class HomePage extends Component {
    render() {
        return(
            <div className="home-page">
                <div className="card-container-h">
                    <h5>I know what I'm looking for</h5>
                    <div class="card" style={{width: '18rem'}}>
                            <img class="card-img-top" src={`${dadPic.url}`} alt={dadPic.title}/>
                            <div class="card-body">
                                <p class="card-text">
                                    Search for up coming library programs, readings and events in your area
                                </p>
                            </div>
                    </div>
                </div>
                <div className="card-container-h">
                    <h5>Help me find programs</h5>
                    <div class="card" style={{width: '18rem'}}>
                            <img class="card-img-top" src={`${dadPic.url}`} alt={dadPic.title}/>
                            <div class="card-body">
                                <p class="card-text">
                                    Take 30 seconds to answer a few questions,we'll help find programs based on your answers
                                </p>
                            </div>
                    </div>
                </div>
            </div>
        )
    }
}