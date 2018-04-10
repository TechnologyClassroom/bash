#!/bin/bash

# gitclone.sh
# Michael McMahon
# Clone and configure your git repositories.

# Usage example:
#   bash gitclone.sh repositoryname
# Where repositoryname is the name of your repository that you want to clone.

# Variables
username=TechnologyClassroom

# Check if an argument was given
if [ -z "$1" ]; then
  echo "No repository entered!"
  exit 1
fi

# Check if the directory already exists
if [ -d "$1" ]; then
  echo "The directory already exists!"
  echo "Appending the date to the folder..."
  mv $1 $1$(date +%Y%m%d-%H%M)
fi

git clone http://github.com/$username/$1
cd $1
echo "Setting git repository for ssh commits..."
git remote set-url origin git@github.com:$username/$1.git
echo "Ready for new commits!"
