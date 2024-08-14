#!/bin/sh

${SMTPC_TAG:=$1}
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg PYTHON_TAG=${PYTHON_TAG:=3.12-slim} \
  ${SMTPC_TAG:+--tag $SMTPC_TAG:$PYTHON_TAG} --load .

if [[ -n "$SMTPC_TAG" ]]; then
bold=$(tput bold)
normal=$(tput sgr0)
blue=$(tput setaf 4)
white=$(tput setaf 256)
cat <<EOF

${bold}Summary of build.sh:${normal}

Docker image was exported locally as "$SMTPC_TAG:$PYTHON_TAG"
This image can be pushed to Docker Hub as 'latest' using:$blue
$ docker tag $SMTPC_TAG:$PYTHON_TAG $SMTPC_TAG:latest
$ docker push -a $SMTPC_TAG
$white
EOF
fi
