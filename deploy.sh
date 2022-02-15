#!/bin/bash
export AWS_DEFAULT_REGION=us-east-2
set -e

if [[ $BRANCH_NAME == main ]]
then
    cd api/
    make deploy stage=main
    cd ..
elif [[ $BRANCH_NAME == prod ]]
then
    cd api/
    make deploy stage=prod
    cd ..
fi