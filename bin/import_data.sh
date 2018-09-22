#!/usr/bin/env bash

docker-compose run web bin/rake import:programs[../data/events.json]