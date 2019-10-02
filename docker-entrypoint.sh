#!/bin/bash

set -e
SCREEN="${SCREEN:-1280x1024x16}"
echo "Starting X virtual framebuffer (Xvfb) for $SCREEN screen in background..."
Xvfb -ac :99 -screen 0 $SCREEN > /dev/null 2>&1 &
export DISPLAY=:99
echo "Starting Automation"
google-chrome --version
which google-chrome
chromedriver -v
which chromedriver
# CHROME_ARGS="--no-sandbox --headless -disable-dev-shm-usage"

# if [ -n "$CHROME_OPTS" ]; then
#   CHROME_ARGS="${CHROME_ARGS} ${CHROME_OPTS}"
# fi

# Start Chrome
# exec sh -c "/usr/bin/google-chrome-stable $CHROME_ARGS"


cd Regression-Framework && git pull && rspec

exec "$@"