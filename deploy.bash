#!/bin/bash

set -e

##########################################################################################
#                                                                                        #
# Checks out a git revision and make sure the repository is cloned on the remote server. #
# After that it builds and starts the service via docker-compose.                        #
#                                                                                        #
##########################################################################################

### Needs those variables in the environment ###
# ENVIRONMENT_NAME  - Name of the enviroment to deploy
# REPO_NAME         - Repository name to deploy
# REPO_URL          - Repository url to deploy
# REVISON           - Git revison to deploy
# ENVIRONMENT       - Enviroment file string to be used with docker-compose files
### Variables end ###

### Configuration ###
# Directory on remote server where services should be located
BASE_DIR=/srv
### Configuration end ###

# Concat paths to get target path of service on remote server
repo_path="$BASE_DIR/$REPO_NAME"

# Check if repository is already cloned
if [ ! -d "$repo_path" ] ; then
    # If not we clone the default branch into the target remote path
    git clone "$REPO_URL" "$repo_path"
fi

# Go into services directory
cd "$repo_path" || exit 1

# Reset current changes if any
git reset --hard

# fetch new branches and tags
git fetch

# Checkout to target revison
git checkout --detach "$REVISON"

# Write enviroment string to file
echo "$ENVIRONMENT" > .env.local

# Pull newer images
docker-compose --env-file .env.local -f docker-compose.yml -f "docker-compose.$ENVIRONMENT_NAME.yml" pull

# Start service up again and build if needed
docker-compose --env-file .env.local -f docker-compose.yml -f "docker-compose.$ENVIRONMENT_NAME.yml" up --detach --build