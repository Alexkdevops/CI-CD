# Custome image of Jenkins-slave
FROM alpine

RUN apk add --update \
    python3 \
    python3-dev \
    py-pip \
  && pip install --upgrade pip awscli boto3

RUN apk add --no-cache bash gawk sed grep bc coreutils make jq curl openrc docker

RUN apk update && apk add curl git

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.1/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl