#!/bin/bash
export AWS_DEFAULT_REGION=us-east-2
set -ex

if [[ $BRANCH_NAME == main ]]
then
    cd api/
    make deploy stage=main
    cd ..
    cd web/
    make deploy stage=main
    cd ..

elif [[ $BRANCH_NAME == prod ]]
then
    cd api/
    make deploy stage=prod
    cd ..
    cd web/
    make deploy stage=prod
    cd ..    
fi