#!/usr/bin/env bash

docker-compose run web bin/rake import:programs[../data/complete_data_set.csv]