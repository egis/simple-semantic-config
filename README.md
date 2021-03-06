# simple-semantic-config

[**semantic-release**](https://github.com/semantic-release/semantic-release) shareable config to publish npm packages with simple commit rules

[![Build Status](https://travis-ci.org/artemv/simple-semantic-config.svg?branch=master)](https://travis-ci.org/artemv/simple-semantic-config)

## Why this project exists
This is a shareable config to publish npm packages with simple commit rules bases on 
[angular](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-angular) 
preset of [commit-analyzer plugin](https://github.com/semantic-release/commit-analyzer#usage) with following change:
`docs`, `chore` and `refactor` commit types yield patch version.
Thus pretty much any correctly formatted commit message yields new version.

## Install

```bash
$ yarn add --dev "simple-semantic-config"
```

## Usage

The shareable config can be configured in the [**semantic-release** configuration file](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#configuration):

```json
{
  "extends": "simple-semantic-config"
}
```

## semantic-release-pre.sh

Figures out new version according to semantic-release configuration, and writes it to build/.version file

Example: `yarn simple-semantic-release-pre`

OR

`ALLOW_FAILING=false BRANCH=development yarn simple-semantic-release-pre`

OR

`OUT_DIR=tmp yarn simple-semantic-release-pre`

