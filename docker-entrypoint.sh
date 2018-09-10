#!/bin/bash

set -e
SCREEN="${SCREEN:-1280x1024x16}"
echo "Starting X virtual framebuffer (Xvfb) for $SCREEN screen in background..."
Xvfb -ac :99 -screen 0 $SCREEN > /dev/null 2>&1 &
export DISPLAY=:99
echo "Starting Automation"
cd Regression-Framework && git pull && rspec


exec "$@"
