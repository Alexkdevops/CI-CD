#!/bin/bash
export AWS_DEFAULT_REGION=us-east-2

if [[ $BRANCH_NAME == main ]]
then
    cd api/
    make deploy namespace=prod
    cd ..
elif [[ $BRANCH_NAME == prod ]]
then
    cd api/
    make deploy namespace=dev
    cd ..
fi