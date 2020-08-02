#!/bin/bash

set -e
SCREEN="${SCREEN:-1280x1024x16}"
echo "Starting X virtual framebuffer (Xvfb) for $SCREEN screen in background..."
Xvfb -ac :99 -screen 0 $SCREEN > /dev/null 2>&1 &
export DISPLAY=:99
export HEADLESS=true
echo "Starting Automation"
google-chrome --version
which google-chrome
chromedriver -v
which chromedriver

bundle exec rspec spec

exec "$@"