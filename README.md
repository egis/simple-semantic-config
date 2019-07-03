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

The shareable config can be configured in the [**semantic-release** configuration file](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#configuration) or package.json:

```json
{
  "release": {
    "extends": "simple-semantic-config"
  }
}
```

## semantic-release-pre.sh

Figures out new version according to semantic-release configuration, and writes it to build/.version file. 

Example: `BRANCH=master yarn simple-semantic-release-pre`

OR

`ALLOW_FAILING=false BRANCH=development yarn simple-semantic-release-pre`

OR

`OUT_DIR=tmp BRANCH=master yarn simple-semantic-release-pre`

This requires having write Git access to repo specified in package.json, you can set it by exporting GH_TOKEN env var with: `export GH_TOKEN=my-key`

When it's run in CircleCI build context it uses CIRCLE_BRANCH so specifying BRANCH is not needed there:
`yarn simple-semantic-release-pre` is enough.

`semantic-release` takes previous versions info from Github tags of `origin` remote, so when running it from local fork switch origin to upstream to get the correct new version:
```
git remote rm origin
git remote add origin git@github.com:upstream/my-project.git
BRANCH=master yarn simple-semantic-release-pre 
git remote rm origin
git remote add origin git@github.com:my-account/my-project.git
``` 
