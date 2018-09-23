import React, { Component } from 'react';
import dad from './dad.jpg'
import './story_slider.css'

const dadPic = {
    title: 'Picture of dad and son reading a book',
    url: dad,
}

const ageGroup = [
    [
        {
            title: 'Pre-School Children',
            image: dadPic,

        },
        {
            title: 'Child',
            image: dadPic,
        },
        {
            title: 'Teen',
            image: dadPic,
        }
    ],
    [
        {
            title: 'Adult',
            image: dadPic,
        },
        {
            title: 'Senior',
            image: dadPic,
        },
        {
            title: 'Family',
            image: dadPic,
        }
    ]
]

export default class StorySlider extends Component {
    state = {
        storyPosition: 0,
      }
      nextPage = () => {
        this.setState({storyPosition: this.state.storyPosition - 10})  
      }

    render(){
        const { storyPosition } = this.state;

        return(
        <div>
            <div className="story" style={{ left: `${storyPosition}%` }} >
            <Page1 />
            </div>
        </div>
        )
    }
}

class Page1 extends Component {
    render(){
        return(
            <React.Fragment>
            <div className="page-story-slider">
                <h3>Help me find some programs</h3>
                <p>Who is this for?</p>
                {
                    ageGroup.map( (data, index) => (
                        <div key={index} className="container">
                            <div className="row">
                                {data.map((group, index) => (
                                    <div key={index} className="col-sm">
                                        <Card
                                        title={group.title}
                                        image={group.image}
                                        />
                            </div>))}
                        </div>
                    </div>
                    ) )
                }
                <h6 className="text-left margin16">Which locations(s)?</h6>
                <input
                    name="location"
                    style={{
                        borderStyle: 'none none solid none'
                    }} 
                    className="input slider-location" 
                    placeholder="Parkdale"
                    onChange={this.handleChange}
                ></input>
                <br />
                <br />

                <div className="text-right" >
                    <button type="button" className="btn btn-primary" onClick={this.nextPage}>
                        Next
                    </button>
                </div>
            </div>
            </React.Fragment>
        )
    }
}
const Card = ({ title, image }) => {
    return (
        <div className="card" style={{width: '18rem'}}>
            <img className="card-img-top" src={`${image.url}`} height="150" width="150" style={{}} alt={image.title}/>
            <div className="card-body">
            <h5 class="card-title text-center">{title}</h5>
            </div>
        </div>
    )
}