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
$ yarn add --dev "artemv/simple-semantic-config"
```

## Usage

The shareable config can be configured in the [**semantic-release** configuration file](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#configuration):

```json
{
  "extends": "simple-semantic-config"
}
```
