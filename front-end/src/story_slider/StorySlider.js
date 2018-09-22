import React, { Component } from 'react';

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
                <div>
        <div className="story" style={{ left: `${storyPosition}%` }} >
          <div className="page">
          <h1>Programs</h1>
          </div>
        </div>
      </div>
      <button type="button" className="btn btn-primary" onClick={this.nextPage}>
        Click me
      </button>
            </div>
        )
    }
}