#!/bin/bash

#setup a new git alias - gitup -- https://stackoverflow.com/questions/17099564/make-a-shell-script-to-update-3-git-repos
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'

#exit if a command fails
set -e

# Get the latest from master branch
git checkout master
git pull

# Get the latest from release and merge master to release
git checkout release
git branch --set-upstream-to=origin/release release
git up master
git push

# Get the latest from pre-release and merge release into pre-release
git checkout pre-release
git branch --set-upstream-to=origin/pre-release pre-release
git up release
git push

 echo 'Merging Complete'
