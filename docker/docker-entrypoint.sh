#!/bin/bash

set -e
SCREEN="${SCREEN:-1280x1024x16}"
SHORTLIVED="${SHORTLIVED:-0}"
echo "Starting X virtual framebuffer (Xvfb) for $SCREEN screen in background..."
Xvfb -ac :99 -screen 0 $SCREEN > /dev/null 2>&1 &
export DISPLAY=:99

echo "Starting Automation"
echo "Shortlived = $SHORTLIVED"

cd automation \
    && gem update --system \
    && gem install bundler \
    && bundle install \
    && rspec spec \
    && echo "Automation Complete" \
    && if [ "$SHORTLIVED" = 0 ]; then
         echo "run ./v cli to access the container" \
         && tail -f /dev/null
       else
         echo "We are all done here, have a great day!"
       fi

exec "$@"