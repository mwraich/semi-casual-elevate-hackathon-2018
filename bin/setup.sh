#! /bin/bash

pushd api
bundle install
rake db:create db:setup
