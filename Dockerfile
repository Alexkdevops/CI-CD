#Custom image of Jankins POD Slave, trying to create image from this file gives error: The command '/bin/sh -c apk add --update     python     python-dev     py-pip   && pip install --upgrade pip awscli boto3' returned a non-zero code: 2

FROM alpine

RUN apk add --update \
    python3 \
    python3-dev \
    py-pip \
  && pip install --upgrade pip awscli boto3

# Other packages
RUN apk add --no-cache bash gawk sed grep bc coreutils make jq curl openrc docker