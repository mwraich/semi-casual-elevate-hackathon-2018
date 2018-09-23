import React from 'react';
import './results_page.css';

const ResultsPage = ({ data = [] }) => {
  console.log(data)
  return (
    <div>
      <ul>
        {
          data.map((result) => (
            <li key={ result.title }><a href={result.link}>{result.title}</a></li>
          ))
        }
      </ul>
    </div>
  )
}

export default ResultsPage