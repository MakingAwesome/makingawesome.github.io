#!/bin/sh
SOURCE_BRANCH='source'
GH_REF='github.com/MakingAwesome/makingawesome.github.io'

git config --get user.name
if [ $? -ne 0 ]; then
  git config user.name $GIT_NAME
  git config user.email $GIT_EMAIL
fi
npm install -g gitbook-cli
git checkout $SOURCE_BRANCH
git fetch origin
gitbook install
gitbook build

cd _book
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "nobody@makingawesome.org"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"
echo Deploying to https://GH_TOKEN@${GH_REF}
git remote add origin "https://${GH_TOKEN}@${GH_REF}"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force origin master > /dev/null 2>&1
