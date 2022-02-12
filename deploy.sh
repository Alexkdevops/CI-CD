#!/bin/bash

# this will force script to exit if any command fails

set -ex # good for bash-scripting trubleshoots

export AWS_DEFAULT_REGION=us-east-2
cd api/
make build
make push

# if [[ $BRANCH_NAME == "main" ]]
# then
#     cd api/
#     make build stage=main
#     make push stage=main
#     make deploy stage=main
#     cd ..
#     cd web/
#     make build stage=main
#     make push stage=main
#     make deploy stage=main
#     cd ..
# elif [[ $BRANCH_NAME == "dev" ]]
# then
#     cd api/
#     make build stage=dev
#     make push stage=dev
#     make deploy stage=dev
#     cd ..
#     cd web/
#     make build stage=dev
#     make push stage=dev
#     make deploy stage=dev
#     cd ..
# elif [[ $BRANCH_NAME == "prod" ]]
# then
#     cd api/
#     make build stage=prod
#     make push stage=prod
#     make deploy stage=prod
#     cd ..
#     cd web/
#     make build stage=prod
#     make push stage=prod
#     make deploy stage=prod
#     cd ..
# fi    