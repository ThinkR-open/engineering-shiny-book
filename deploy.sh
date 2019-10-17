#!/bin/bash
set -o errexit -o nounset
BASE_REPO=$PWD

update_website() {
  cd ..; mkdir gh-pages; cd gh-pages
  git init
  git config user.name "Sébastien Rochette"
  git config user.email "sebastienrochettefr@gmail.com"
  git config --global push.default simple
  git remote add upstream "https://$GH_TOKEN@github.com/ThinkR-open/building-shiny-apps-workflow.git"
  git fetch upstream 2>err.txt
  git checkout gh-pages
  
  cp -fvr $BASE_REPO/docs/* .
  git add *
  git commit -a -m "Updating book (${TRAVIS_BUILD_NUMBER})"
  git status
  git push 2>err.txt
  git status
  cd ..
}

update_website