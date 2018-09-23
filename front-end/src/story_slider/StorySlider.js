import React, { Component } from 'react';
import dad from './dad.jpg'
import './story_slider.css'
import adult from './age_group_icons/Adult.png'
import child from './age_group_icons/Child.png'
import family from './age_group_icons/Family.png'
import preSchool from './age_group_icons/Pre_School.png'
import senior from './age_group_icons/Senior.png'
import teen from './age_group_icons/Teen.png'

import creativity from './category_images/CreativityDEFAULT.jpg'
import creativityColor from './category_images/CreativityBG.jpg'
import culture from './category_images/CultureDEFAULT.jpg'
import cultureColor from './category_images/CultureBG.jpg'
import health from './category_images/HealthDEFAULT.jpg'
import healthColor from './category_images/HealthBG.jpg'
import learning from './category_images/LearningDEFAULT.jpg'
import learningColor from './category_images/LearningBG.jpg'
import lifeSkill from './category_images/LifeskillsDEFAULT.jpg'
import lifeSkillColor from './category_images/LifeskillsBG.jpg'

const dadPic = {
    title: 'Picture of dad and son reading a book',
    url: dad,
}

const category_images = [
    [
        {
            title: 'Fostering Creativity',
            image: {
                url: creativityColor
            },
        },
        {
            title: 'Connecting with Culture',
            image: {
                url: cultureColor
            },
        },
        {
            title: 'Bulding a Healthy LifeStyle',
            image: {
                url: healthColor,
            },
        },
    ],
    [
        {
            title: 'Reading & Learning',
            image: {
                url: learningColor,
            },
        },
        {
            title: 'Gaining Life Skills',
            image: {
                url: lifeSkillColor
            },
        },
        {
            title: '',
            image: {

            }
        }
    ]
]



const ageGroup = [
    [
        {
            title: 'Pre-School Children',
            image: {
                url: preSchool
            },

        },
        {
            title: 'Child',
            image: { 
                url: child
            },
        },
        {
            title: 'Teen',
            image: {
                url: teen
            },
        }
    ],
    [
        {
            title: 'Adult',
            image: {
                url: adult
            },
        },
        {
            title: 'Senior',
            image: {
                url: senior
            },
        },
        {
            title: 'Family',
            image: {
                url: family
            },
        }
    ]
]

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
                        borderStyle: 'none none solid none',
                        background: '#E8EFF6'
                        
                    }} 
                    className="input slider-location" 
                    placeholder="Parkdale"
                    onChange={this.handleChange}
                ></input>
                <br />
                <br />

                <div className="text-right" >
                    <button type="button" className="btn btn-primary" onClick={this.props.nextPage}>
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
        <div className="card" style={{width: '14rem',  height: '14rem', margin: '1em 0em'}}>
            <img className="card-img-top" src={`${image.url}`} height="120" width="120" style={{padding: '0em 2em', marginTop: '1rem'}} alt={image.title}/>
            <div className="card-body">
            <h5 className="card-title text-center" style={{marginTop: '1rem'}}>{title}</h5>
            </div>
        </div>
    )
}

const Card2 = ({ title, image }) => {
    return (
        <div className="card" style={{width: '18rem', margin: '1em 0em', borderTopLeftRadius: '1em', borderTopRightRadius: '1em'}}>
            <img className="card-img-top" src={`${image.url}`} height="" width="" style={{padding: '0em 0em', borderTopLeftRadius: '1em', borderTopRightRadius: '1em'}} alt={image.title}/>
            <div className="card-body">
            <h5 className="card-title text-center">{title}</h5>
            </div>
        </div>
    )
}

class Page2 extends Component {
    render(){
        return(
            <React.Fragment>
                <div className="page-story-slider">
                    <h3 className="text-left">What kind of programs interest you?</h3>
                    {
                        category_images.map( (data, index) => (
                            <div key={index} className="container">
                                <div className="row" style={{justifyContent: 'center'}} >
                                    {data.map((category, index) => (
                                        <div key={index} className="col-sm">
                                            {category.title === '' ? <div></div> : 
                                            <Card2
                                            title={category.title}
                                            image={category.image}
                                            />}
                                </div>))}
                            </div>
                        </div>
                        ) )
                    }
                    <br />
                    <br />

                    <div className="text-right" >
                        <button type="button" className="btn btn-primary" onClick={this.props.nextPage}>
                            Next
                        </button>
                    </div>
                </div>
            </React.Fragment>            
        )
    }
}
export default class StorySlider extends Component {
    state = {
        storyPosition: '',
        showPage2: false,
      }
      nextPage = () => {
        this.setState({showPage2: true})  
      }

    render(){
        const { storyPosition } = this.state;
        return(
        <div>
            <div className="story" style={{ left: `${storyPosition}%`, margin: '0 auto', justifyContent: 'center' }} >
                {!this.state.showPage2? <Page1 nextPage={this.nextPage} />: <Page2 nextPage={this.nextPage} />}
            </div>
        </div>
        )
    }
}

