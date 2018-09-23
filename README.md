Toronto Public Library Project Picker (TPLPP) is a web app designed to utilize the toronto public libraries multiple 
public data sets and aggregate them in to one central database that can then be filtered, searched and analyzed using all of 
the data available in one singular place. 

This app utilizes a rails api backend and a react front-end. It uses a json parser script to convert the library datasets 
into our database, and can be easily updated when the data is updated (i.e. run a new import for a new file).

To run the app, you will need to git clone the app.

`git clone git@github.com:mwraich/semi-casual-elevate-hackathon-2018.git`

Rails is used in the backend so you'll need to cd into the api directory, install the corresponding gems, `bundle install`, create your db. `rails db:create` and 
then run migrations `rake db:migrate`.  

We use docker for containerization so you'll need to build your docker image. 

`bin/build.sh`

To start your api server you'll run

 `run bin/start.sh`
 
Then cd into the front end directory and run `npm start`. 

This project was bootstrapped with [Create React App](https://github.com/facebookincubator/create-react-app).
