#!/bin/bash

if [[ "$OUT_DIR" == "" ]]; then
  OUT_DIR=build
fi

mkdir $OUT_DIR
CIRCLE_PR_NUMBER="" CIRCLE_PR_REPONAME="" CIRCLE_PR_USERNAME="" CIRCLE_PULL_REQUEST="" CIRCLE_PULL_REQUESTS="" CI_PULL_REQUEST="" CI_PULL_REQUESTS="" CIRCLE_BRANCH="master" yarn semantic-release --dry-run > $OUT_DIR/semantic-dry.out || true
cat $OUT_DIR/semantic-dry.out
perl -ne 'print "$1\n" if /The next release version is (.*)$/' $OUT_DIR/semantic-dry.out > $OUT_DIR/.version
VERSION=$(cat $OUT_DIR/.version)
if [ "${VERSION}" == "" ]; then
    echo "Semantic version isn't generated - please investigate"
    exit -1
fi
cat $OUT_DIR/.version
