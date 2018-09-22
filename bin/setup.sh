#! /bin/bash

echo "Setting up database.yml"
cp config/database.yml{.sample,}

echo "Installing bundler"
gem install bundler --no-ri --no-rdoc || panic "Error installing bundler"

echo "Setting up Rails and Postgres"
pushd api
bundle install || panic "Error installing rails dependencies"
rake db:create db:setup
echo "Setting up database..."
rake db:create db:schema:load 2>&1 > /dev/null || panic "Error running database related rake tasks, you should have a postgresql."


echo ""
echo ""
echo ""
echo "**********"
echo "Setup finished successfully"
echo "**********"
