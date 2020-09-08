#!/bin/bash

if [[ "$OUT_DIR" == "" ]]; then
  OUT_DIR=build
fi

mkdir $OUT_DIR
if [[ "${BRANCH}" == "" ]]; then export BRANCH=${CIRCLE_BRANCH}; fi
CIRCLE_PR_NUMBER="" CIRCLE_PR_REPONAME="" CIRCLE_PR_USERNAME="" CIRCLE_PULL_REQUEST="" CIRCLE_PULL_REQUESTS="" CI_PULL_REQUEST="" CI_PULL_REQUESTS="" yarn semantic-release --dry-run --branches $BRANCH > $OUT_DIR/semantic-dry.out || true
cat $OUT_DIR/semantic-dry.out
perl -ne 'print "$1\n" if /next release version is (.*)$/' $OUT_DIR/semantic-dry.out > $OUT_DIR/.version
VERSION=$(cat $OUT_DIR/.version)
if [ "${VERSION}" == "" ]; then
    echo "Semantic version isn't generated - please investigate"
    if [ "${ALLOW_FAILING}" == "false" ]; then
      exit -1
    else
      echo "..but we allow failing"
    fi
fi
cat $OUT_DIR/.version
